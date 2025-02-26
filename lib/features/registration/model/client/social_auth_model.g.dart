// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialAuthModel _$SocialAuthModelFromJson(Map<String, dynamic> json) =>
    SocialAuthModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      authId: json['auth_id'] as String?,
      profilePicture: json['profile_picture'] as String?,
      authProvider: json['auth_provider'] as String?,
    );

Map<String, dynamic> _$SocialAuthModelToJson(SocialAuthModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'auth_id': instance.authId,
      'profile_picture': instance.profilePicture,
      'auth_provider': instance.authProvider,
    };
