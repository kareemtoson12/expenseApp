import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/signup_request_model.dart';
import '../../domain/models/signup_response_model.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/register')
  Future<SignUpResponseModel> signUp(@Body() SignUpRequestModel request);
}
