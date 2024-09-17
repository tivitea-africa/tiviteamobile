import 'package:json_annotation/json_annotation.dart';

part 'login_request_object.g.dart';

@JsonSerializable()
class LoginRequestObject {
  final String? email;
  final String? password;

  LoginRequestObject({
    this.email,
    this.password,
  });

  factory LoginRequestObject.fromJson(
          Map<String, dynamic> json) =>
      _$LoginRequestObjectFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginRequestObjectToJson(this);
}

@JsonSerializable()
class ForgotPasswordRequestObject {
  final String? email;

  ForgotPasswordRequestObject({
    this.email,
  });

  factory ForgotPasswordRequestObject.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestObjectToJson(this);
}
