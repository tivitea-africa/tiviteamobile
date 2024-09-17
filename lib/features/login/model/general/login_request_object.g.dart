// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestObject _$LoginRequestObjectFromJson(Map<String, dynamic> json) =>
    LoginRequestObject(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginRequestObjectToJson(LoginRequestObject instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

ForgotPasswordRequestObject _$ForgotPasswordRequestObjectFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequestObject(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordRequestObjectToJson(
        ForgotPasswordRequestObject instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
