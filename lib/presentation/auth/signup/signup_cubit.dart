import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';
import '../../../domain/models/signup_request_model.dart';
import '../../../data/api/auth_api_service.dart';
import '../../../domain/models/api_error_handler.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthApiService apiService;

  SignUpCubit({required this.apiService}) : super(SignUpInitial());

  Future<void> signUp(SignUpRequestModel request) async {
    emit(SignUpLoading());
    try {
      final response = await apiService.signUp(request);
      emit(SignUpSuccess(response));
    } catch (e) {
      final errorMessage = ApiErrorHandler.handleError(e);
      emit(SignUpError(errorMessage));
    }
  }
}
