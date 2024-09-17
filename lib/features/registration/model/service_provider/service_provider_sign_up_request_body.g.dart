// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider_sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceProviderSignUpRequestBody _$ServiceProviderSignUpRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ServiceProviderSignUpRequestBody(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirm_password'] as String?,
      alternatePhoneNumber: json['alternate_phone_number'] as String?,
      companyName: json['company_name'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      businessDescription: json['business_description'] as String?,
      businessType: json['business_type'] as String?,
    );

Map<String, dynamic> _$ServiceProviderSignUpRequestBodyToJson(
        ServiceProviderSignUpRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      'alternate_phone_number': instance.alternatePhoneNumber,
      'company_name': instance.companyName,
      'address': instance.address,
      'business_description': instance.businessDescription,
      'business_type': instance.businessType,
    };
