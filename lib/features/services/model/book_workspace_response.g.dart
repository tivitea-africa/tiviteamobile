// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_workspace_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookWorkSpaceResponse _$BookWorkSpaceResponseFromJson(
        Map<String, dynamic> json) =>
    BookWorkSpaceResponse(
      id: json['id'] as String?,
      listing: json['listing'] == null
          ? null
          : ListingResponseModel.fromJson(
              json['listing'] as Map<String, dynamic>),
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      subListing: json['subListing'] == null
          ? null
          : SubListing.fromJson(json['subListing'] as Map<String, dynamic>),
      status: json['status'] as String?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      amount: (json['amount'] as num?)?.toDouble(),
      pickUpDate: json['pick_up_date'] == null
          ? null
          : DateTime.parse(json['pick_up_date'] as String),
      returnDate: json['return_date'] == null
          ? null
          : DateTime.parse(json['return_date'] as String),
      numOfPeople: (json['num_of_people'] as num?)?.toInt(),
      listingAmount: (json['listing_amount'] as num?)?.toDouble(),
      paymentStatus: json['payment_status'] as String?,
      isCheckedIn: json['is_checked_in'] as String?,
      serviceCharge: (json['service_charge'] as num?)?.toDouble(),
      footSoldierCharge: (json['foot_soldier_charge'] as num?)?.toDouble(),
      cautionaryCharge: (json['cautionary_charge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookWorkSpaceResponseToJson(
        BookWorkSpaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listing': instance.listing,
      'client': instance.client,
      'subListing': instance.subListing,
      'status': instance.status,
      'date_created': instance.dateCreated?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'amount': instance.amount,
      'pick_up_date': instance.pickUpDate?.toIso8601String(),
      'return_date': instance.returnDate?.toIso8601String(),
      'num_of_people': instance.numOfPeople,
      'listing_amount': instance.listingAmount,
      'payment_status': instance.paymentStatus,
      'is_checked_in': instance.isCheckedIn,
      'service_charge': instance.serviceCharge,
      'foot_soldier_charge': instance.footSoldierCharge,
      'cautionary_charge': instance.cautionaryCharge,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      meta: json['meta'] as Map<String, dynamic>?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'date_created': instance.dateCreated?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'meta': instance.meta,
      'gender': instance.gender,
    };

SubListing _$SubListingFromJson(Map<String, dynamic> json) => SubListing(
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
      amount: (json['amount'] as num?)?.toDouble(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      listing: json['listing'] as String?,
    );

Map<String, dynamic> _$SubListingToJson(SubListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_created': instance.dateCreated?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'meta': instance.meta,
      'name': instance.name,
      'images': instance.images,
      'description': instance.description,
      'max_capacity': instance.maxCapacity,
      'amount': instance.amount,
      'features': instance.features,
      'listing': instance.listing,
    };
