// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_working_space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostWorkingSpaceModel _$PostWorkingSpaceModelFromJson(
        Map<String, dynamic> json) =>
    PostWorkingSpaceModel(
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
      footSoldier: json['foot_soldier'] as String?,
    );

Map<String, dynamic> _$PostWorkingSpaceModelToJson(
        PostWorkingSpaceModel instance) =>
    <String, dynamic>{
      'listing_type': instance.listingType,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'category_id': instance.categoryId,
      'images': instance.images,
      'amenities': instance.amenities,
      'pricing_option': instance.pricingOption,
      'room': instance.room,
      'foot_soldier': instance.footSoldier,
    };
