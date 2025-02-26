// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialAuthResponse _$SocialAuthResponseFromJson(Map<String, dynamic> json) =>
    SocialAuthResponse(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      dateCreated: json['date_created'] as String?,
      lastUpdated: json['last_updated'] as String?,
      authProvider: json['auth_provider'] as String?,
      authId: json['auth_id'] as String?,
      kycIsVerified: json['kyc_is_verified'] as bool?,
      favoriteListings: (json['favorite_listings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tokens: json['tokens'] == null
          ? null
          : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      entityType:
          $enumDecodeNullable(_$EntityTypeEnumMap, json['entity_type']) ??
              EntityType.client,
    );

Map<String, dynamic> _$SocialAuthResponseToJson(SocialAuthResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'date_created': instance.dateCreated,
      'last_updated': instance.lastUpdated,
      'auth_provider': instance.authProvider,
      'auth_id': instance.authId,
      'kyc_is_verified': instance.kycIsVerified,
      'favorite_listings': instance.favoriteListings,
      'tokens': instance.tokens,
      'entity_type': _$EntityTypeEnumMap[instance.entityType],
    };

const _$EntityTypeEnumMap = {
  EntityType.partner: 'partner',
  EntityType.client: 'client',
};
