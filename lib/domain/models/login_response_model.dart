import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'message')
  final String message;
  
  @JsonKey(name: 'data')
  final LoginData data;
  
  @JsonKey(name: 'status')
  final bool status;
  
  @JsonKey(name: 'code')
  final int code;

  LoginResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'token')
  final String token;
  
  @JsonKey(name: 'username')
  final String username;

  LoginData({
    required this.token,
    required this.username,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
} 