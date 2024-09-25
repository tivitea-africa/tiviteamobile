import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/home/model/client/category_response_model.dart';
import 'package:tivi_tea/models/address_model.dart';
import 'package:tivi_tea/models/user_model.dart';

part 'listing_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ListingResponseModel {
  final String? id;
  final CategoryResponseModel? category;
  final List<String>? amenities;
  final List<Room>? rooms;
  final Partner? partner;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final Map<String, dynamic>? meta;
  final String? name;
  final String? description;
  final String? address;
  final List<String>? images;
  @JsonKey(name: 'listing_type')
  final String? listingType;
  final num? amount;
  final String? status;
  @JsonKey(name: 'pricing_option')
  final String? pricingOption;
  @JsonKey(name: 'foot_soldier')
  final bool? footSoldier;
  @JsonKey(name: 'cautionary_fee')
  final num? cautionaryFee;
  @JsonKey(name: 'is_favorites')
  final bool? isFavorites;

  ListingResponseModel({
    this.id,
    this.category,
    this.amenities,
    this.rooms,
    this.partner,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.name,
    this.description,
    this.address,
    this.images,
    this.listingType,
    this.amount,
    this.status,
    this.pricingOption,
    this.footSoldier,
    this.cautionaryFee,
    this.isFavorites,
  });

  factory ListingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListingResponseModelToJson(this);
}

@JsonSerializable()
class Room {
  final String? id;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final Map<String, dynamic>? meta;
  final String? name;
  final List<String>? images;
  final String? description;
  @JsonKey(name: 'max_capacity')
  final int? maxCapacity;
  final num? amount;
  final String? listing;

  Room({
    this.id,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.name,
    this.images,
    this.description,
    this.maxCapacity,
    this.amount,
    this.listing,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Partner {
  final String? id;
  final User? user;
  final Address? address;
  final DateTime? dateCreated;
  final DateTime? lastUpdated;
  final Map<String, dynamic>? meta;
  final String? companyName;
  final String? alternatePhoneNumber;
  final String? businessDescription;
  final String? website;
  final String? businessType;
  final String? footSoldier;

  Partner({
    this.id,
    this.user,
    this.address,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.companyName,
    this.alternatePhoneNumber,
    this.businessDescription,
    this.website,
    this.businessType,
    this.footSoldier,
  });

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerToJson(this);
}
