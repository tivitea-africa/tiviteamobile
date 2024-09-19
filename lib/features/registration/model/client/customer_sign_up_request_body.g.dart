// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerSignUpRequestBody _$CustomerSignUpRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CustomerSignUpRequestBody(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirm_password'] as String?,
    );

Map<String, dynamic> _$CustomerSignUpRequestBodyToJson(
        CustomerSignUpRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };

CustomerSignUpResponseBody _$CustomerSignUpResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CustomerSignUpResponseBody(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      meta: json['meta'] as Map<String, dynamic>?,
      authProvider: json['auth_provider'] as String?,
      authId: json['auth_id'] as String?,
      favoriteListings: (json['favorite_listings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CustomerSignUpResponseBodyToJson(
        CustomerSignUpResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'date_created': instance.dateCreated?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'meta': instance.meta,
      'auth_provider': instance.authProvider,
      'auth_id': instance.authId,
      'favorite_listings': instance.favoriteListings,
    };
