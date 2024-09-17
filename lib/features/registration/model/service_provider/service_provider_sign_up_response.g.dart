// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider_sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceProviderSignUpResponse _$ServiceProviderSignUpResponseFromJson(
        Map<String, dynamic> json) =>
    ServiceProviderSignUpResponse(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      meta: json['meta'] as Map<String, dynamic>?,
      companyName: json['company_name'] as String?,
      alternatePhoneNumber: json['alternate_phone_number'] as String?,
      businessDescription: json['business_description'] as String?,
      website: json['website'] as String?,
      businessType: json['business_type'] as String?,
      footSoldier: json['foot_soldier'] as String?,
    );

Map<String, dynamic> _$ServiceProviderSignUpResponseToJson(
        ServiceProviderSignUpResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'address': instance.address,
      'date_created': instance.dateCreated?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'meta': instance.meta,
      'company_name': instance.companyName,
      'alternate_phone_number': instance.alternatePhoneNumber,
      'business_description': instance.businessDescription,
      'website': instance.website,
      'business_type': instance.businessType,
      'foot_soldier': instance.footSoldier,
    };
