import 'package:equatable/equatable.dart';
import '../../../domain/models/signup_response_model.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponseModel response;
  const SignUpSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class SignUpError extends SignUpState {
  final String message;
  const SignUpError(this.message);

  @override
  List<Object?> get props => [message];
}
