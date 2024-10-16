// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_worktool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkToolListing _$WorkToolListingFromJson(Map<String, dynamic> json) =>
    WorkToolListing(
      listingType: json['listing_type'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      categoryId: json['category_id'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      amount: json['amount'] as num?,
      footSoldier: json['foot_soldier'] as String?,
    );

Map<String, dynamic> _$WorkToolListingToJson(WorkToolListing instance) =>
    <String, dynamic>{
      'listing_type': instance.listingType,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'category_id': instance.categoryId,
      'images': instance.images,
      'amount': instance.amount,
      'foot_soldier': instance.footSoldier,
    };
