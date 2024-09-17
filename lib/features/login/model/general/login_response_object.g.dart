// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseObject _$LoginResponseObjectFromJson(Map<String, dynamic> json) =>
    LoginResponseObject(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      dateCreated: json['date_created'] as String?,
      lastUpdated: json['last_updated'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
      companyName: json['company_name'] as String?,
      alternatePhoneNumber: json['alternate_phone_number'] as String?,
      businessDescription: json['business_description'] as String?,
      website: json['website'] as String?,
      businessType: json['business_type'] as String?,
      footSoldier: json['foot_soldier'] as String?,
      tokens: json['tokens'] == null
          ? null
          : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseObjectToJson(
        LoginResponseObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'address': instance.address,
      'date_created': instance.dateCreated,
      'last_updated': instance.lastUpdated,
      'meta': instance.meta,
      'company_name': instance.companyName,
      'alternate_phone_number': instance.alternatePhoneNumber,
      'business_description': instance.businessDescription,
      'website': instance.website,
      'business_type': instance.businessType,
      'foot_soldier': instance.footSoldier,
      'tokens': instance.tokens,
    };

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
    );

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };
