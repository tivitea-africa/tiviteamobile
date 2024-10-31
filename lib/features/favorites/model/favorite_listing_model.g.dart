// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteListingModel _$FavoriteListingModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteListingModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      amount: json['amount'] as num?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FavoriteListingModelToJson(
        FavoriteListingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'images': instance.images,
      'amount': instance.amount,
      'rating': instance.rating,
    };
