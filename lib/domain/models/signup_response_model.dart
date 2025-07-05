import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final SignUpData data;

  @JsonKey(name: 'status')
  final bool status;

  @JsonKey(name: 'code')
  final int code;

  SignUpResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class SignUpData {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'username')
  final String username;

  SignUpData({required this.token, required this.username});

  factory SignUpData.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpDataToJson(this);
}
