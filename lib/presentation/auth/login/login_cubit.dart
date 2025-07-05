import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import '../../../domain/models/login_request_model.dart';
import '../../../data/api/auth_api_service.dart';
import '../../../domain/models/api_error_handler.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthApiService apiService;

  LoginCubit({required this.apiService}) : super(LoginInitial());

  Future<void> login(LoginRequestModel request) async {
    emit(LoginLoading());
    try {
      final response = await apiService.login(request);
      emit(LoginSuccess(response));
    } catch (e) {
      final errorMessage = ApiErrorHandler.handleError(e);
      emit(LoginError(errorMessage));
    }
  }
}
