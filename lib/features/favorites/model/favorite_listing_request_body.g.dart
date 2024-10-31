// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_listing_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteListingRequestBody _$FavoriteListingRequestBodyFromJson(
        Map<String, dynamic> json) =>
    FavoriteListingRequestBody(
      listingId: json['listing_id'] as String?,
      action:
          $enumDecodeNullable(_$FavoriteActionTypeEnumMap, json['action']) ??
              FavoriteActionType.add,
    );

Map<String, dynamic> _$FavoriteListingRequestBodyToJson(
        FavoriteListingRequestBody instance) =>
    <String, dynamic>{
      'listing_id': instance.listingId,
      'action': _$FavoriteActionTypeEnumMap[instance.action],
    };

const _$FavoriteActionTypeEnumMap = {
  FavoriteActionType.add: 'add',
  FavoriteActionType.remove: 'remove',
};
