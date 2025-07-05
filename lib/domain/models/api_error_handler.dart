import 'package:dio/dio.dart';
import 'error_model.dart';

class ApiErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is ErrorModel) {
      return _handleApiError(error);
    } else {
      return _handleGenericError(error);
    }
  }

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';

      case DioExceptionType.badResponse:
        return _handleHttpError(
          error.response?.statusCode,
          error.response?.data,
        );

      case DioExceptionType.cancel:
        return 'Request was cancelled.';

      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network settings.';

      case DioExceptionType.badCertificate:
        return 'SSL certificate error. Please try again later.';

      case DioExceptionType.unknown:
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  static String _handleHttpError(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return _extractUserFriendlyMessage(data) ??
            'Please check your information and try again.';

      case 401:
        return _extractUserFriendlyMessage(data) ??
            'Your session has expired. Please login again.';

      case 403:
        return _extractUserFriendlyMessage(data) ??
            'You don\'t have permission to perform this action.';

      case 404:
        return _extractUserFriendlyMessage(data) ??
            'The requested information was not found.';

      case 422:
        return _extractValidationErrors(data) ??
            'Please check your information and try again.';

      case 429:
        return 'You\'ve made too many requests. Please wait a moment and try again.';

      case 500:
        return _extractUserFriendlyMessage(data) ??
            'Something went wrong on our end. Please try again later.';

      case 502:
        return 'We\'re experiencing technical difficulties. Please try again later.';

      case 503:
        return 'Our service is temporarily unavailable. Please try again later.';

      case 504:
        return 'The request is taking too long. Please try again later.';

      default:
        return _extractUserFriendlyMessage(data) ??
            'Something went wrong. Please try again.';
    }
  }

  static String _handleApiError(ErrorModel error) {
    if (error.status == false) {
      return error.message;
    }

    if (error.code != null) {
      return _handleHttpError(error.code, null);
    }

    return error.message;
  }

  static String _handleGenericError(dynamic error) {
    if (error is String) {
      return error;
    }

    if (error.toString().contains('Exception')) {
      return 'An error occurred: ${error.toString()}';
    }

    return 'An unexpected error occurred. Please try again.';
  }

  static String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      // Try to extract message from common API response formats
      return data['message'] ??
          data['error'] ??
          data['error_message'] ??
          data['msg'];
    }
    return null;
  }

  static String? _extractUserFriendlyMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      // Try to extract message from common API response formats
      final message =
          data['message'] ??
          data['error'] ??
          data['error_message'] ??
          data['msg'];

      if (message != null) {
        // Make the message more user-friendly
        return _makeUserFriendly(message.toString());
      }
    }
    return null;
  }

  static String? _extractValidationErrors(dynamic data) {
    if (data is Map<String, dynamic>) {
      final errors = data['errors'];
      if (errors is Map<String, dynamic>) {
        // Collect all validation errors
        List<String> errorMessages = [];

        errors.forEach((field, error) {
          if (error is List && error.isNotEmpty) {
            errorMessages.add(_makeUserFriendly(error.first.toString()));
          } else if (error is String) {
            errorMessages.add(_makeUserFriendly(error));
          }
        });

        if (errorMessages.isNotEmpty) {
          // Return the first error, or combine multiple errors
          if (errorMessages.length == 1) {
            return errorMessages.first;
          } else {
            return 'Please fix the following issues:\n${errorMessages.take(3).join('\n')}';
          }
        }
      }

      // Try to get message from data
      return _extractUserFriendlyMessage(data);
    }
    return null;
  }

  static String _makeUserFriendly(String message) {
    // Convert technical error messages to user-friendly ones
    message = message.toLowerCase();

    if (message.contains('email')) {
      if (message.contains('already taken') ||
          message.contains('already exists')) {
        return 'This email is already registered. Please use a different email or try logging in.';
      } else if (message.contains('invalid') || message.contains('format')) {
        return 'Please enter a valid email address.';
      } else if (message.contains('not found') ||
          message.contains('does not exist')) {
        return 'No account found with this email. Please check your email or create a new account.';
      }
    }

    if (message.contains('password')) {
      if (message.contains('confirmation') || message.contains('match')) {
        return 'Passwords do not match. Please make sure both passwords are the same.';
      } else if (message.contains('minimum') || message.contains('length')) {
        return 'Password must be at least 6 characters long.';
      } else if (message.contains('incorrect') ||
          message.contains('wrong') ||
          message.contains('invalid')) {
        return 'Incorrect password. Please check your password and try again.';
      }
    }

    if (message.contains('name')) {
      if (message.contains('required')) {
        return 'Please enter your full name.';
      }
    }

    if (message.contains('phone')) {
      if (message.contains('invalid') || message.contains('format')) {
        return 'Please enter a valid phone number.';
      }
    }

    if (message.contains('gender')) {
      if (message.contains('required')) {
        return 'Please select your gender.';
      }
    }

    if (message.contains('credentials') || message.contains('authentication')) {
      return 'Invalid email or password. Please check your credentials and try again.';
    }

    // Remove technical terms and make more conversational
    message = message
        .replaceAll('unprocessable entity', '')
        .replaceAll('validation failed', '')
        .replaceAll('the given data was invalid', '')
        .trim();

    if (message.isEmpty) {
      return 'Please check your information and try again.';
    }

    // Capitalize first letter and make it more conversational
    return message[0].toUpperCase() + message.substring(1);
  }

  // Helper method to check if error is network related
  static bool isNetworkError(dynamic error) {
    if (error is DioException) {
      return error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout;
    }
    return false;
  }

  // Helper method to check if error is authentication related
  static bool isAuthError(dynamic error) {
    if (error is DioException && error.response?.statusCode == 401) {
      return true;
    }
    if (error is ErrorModel && error.code == 401) {
      return true;
    }
    return false;
  }

  // Helper method to check if error is validation related
  static bool isValidationError(dynamic error) {
    if (error is DioException && error.response?.statusCode == 422) {
      return true;
    }
    if (error is ErrorModel && error.code == 422) {
      return true;
    }
    return false;
  }
}
