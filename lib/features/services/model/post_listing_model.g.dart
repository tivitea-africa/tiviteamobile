// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostListingModel _$PostListingModelFromJson(Map<String, dynamic> json) =>
    PostListingModel(
      listingType: json['listing_type'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      categoryId: json['category_id'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pricingOption: json['pricing_option'] as String?,
      room: (json['room'] as List<dynamic>?)
          ?.map((e) => WorkspaceRoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostListingModelToJson(PostListingModel instance) =>
    <String, dynamic>{
      if (instance.listingType case final value?) 'listing_type': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.address case final value?) 'address': value,
      if (instance.categoryId case final value?) 'category_id': value,
      if (instance.images case final value?) 'images': value,
      if (instance.amenities case final value?) 'amenities': value,
      if (instance.pricingOption case final value?) 'pricing_option': value,
      if (instance.room case final value?) 'room': value,
    };
