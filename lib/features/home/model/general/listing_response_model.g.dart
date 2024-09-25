// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingResponseModel _$ListingResponseModelFromJson(
        Map<String, dynamic> json) =>
    ListingResponseModel(
      id: json['id'] as String?,
      category: json['category'] == null
          ? null
          : CategoryResponseModel.fromJson(
              json['category'] as Map<String, dynamic>),
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      partner: json['partner'] == null
          ? null
          : Partner.fromJson(json['partner'] as Map<String, dynamic>),
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      meta: json['meta'] as Map<String, dynamic>?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      listingType: json['listing_type'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      status: json['status'] as String?,
      pricingOption: json['pricing_option'] as String?,
      footSoldier: json['foot_soldier'] as bool?,
      cautionaryFee: (json['cautionary_fee'] as num?)?.toInt(),
      isFavorites: json['is_favorites'] as bool?,
    );

Map<String, dynamic> _$ListingResponseModelToJson(
        ListingResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category?.toJson(),
      'amenities': instance.amenities,
      'rooms': instance.rooms?.map((e) => e.toJson()).toList(),
      'partner': instance.partner?.toJson(),
      'date_created': instance.dateCreated?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'meta': instance.meta,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'images': instance.images,
      'listing_type': instance.listingType,
      'amount': instance.amount,
      'status': instance.status,
      'pricing_option': instance.pricingOption,
      'foot_soldier': instance.footSoldier,
      'cautionary_fee': instance.cautionaryFee,
      'is_favorites': instance.isFavorites,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as String?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      meta: json['meta'] as Map<String, dynamic>?,
      name: json['name'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      maxCapacity: (json['max_capacity'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      listing: json['listing'] as String?,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'date_created': instance.dateCreated?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'meta': instance.meta,
      'name': instance.name,
      'images': instance.images,
      'description': instance.description,
      'max_capacity': instance.maxCapacity,
      'amount': instance.amount,
      'listing': instance.listing,
    };

Partner _$PartnerFromJson(Map<String, dynamic> json) => Partner(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      meta: json['meta'] as Map<String, dynamic>?,
      companyName: json['companyName'] as String?,
      alternatePhoneNumber: json['alternatePhoneNumber'] as String?,
      businessDescription: json['businessDescription'] as String?,
      website: json['website'] as String?,
      businessType: json['businessType'] as String?,
      footSoldier: json['footSoldier'] as String?,
    );

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'address': instance.address?.toJson(),
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'meta': instance.meta,
      'companyName': instance.companyName,
      'alternatePhoneNumber': instance.alternatePhoneNumber,
      'businessDescription': instance.businessDescription,
      'website': instance.website,
      'businessType': instance.businessType,
      'footSoldier': instance.footSoldier,
    };
