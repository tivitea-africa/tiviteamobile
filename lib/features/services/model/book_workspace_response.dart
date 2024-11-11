import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/models/user_model.dart';

part 'book_workspace_response.g.dart';

@JsonSerializable()
class BookWorkSpaceResponse {
  final String? id;
  final ListingResponseModel? listing;
  final Client? client;
  final SubListing? subListing;
  final String? status;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final double? amount;
  @JsonKey(name: 'pick_up_date')
  final DateTime? pickUpDate;
  @JsonKey(name: 'return_date')
  final DateTime? returnDate;
  @JsonKey(name: 'num_of_people')
  final int? numOfPeople;
  @JsonKey(name: 'listing_amount')
  final double? listingAmount;
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @JsonKey(name: 'is_checked_in')
  final String? isCheckedIn;
  @JsonKey(name: 'service_charge')
  final double? serviceCharge;
  @JsonKey(name: 'foot_soldier_charge')
  final double? footSoldierCharge;
  @JsonKey(name: 'cautionary_charge')
  final double? cautionaryCharge;

  BookWorkSpaceResponse({
    this.id,
    this.listing,
    this.client,
    this.subListing,
    this.status,
    this.dateCreated,
    this.lastUpdated,
    this.amount,
    this.pickUpDate,
    this.returnDate,
    this.numOfPeople,
    this.listingAmount,
    this.paymentStatus,
    this.isCheckedIn,
    this.serviceCharge,
    this.footSoldierCharge,
    this.cautionaryCharge,
  });

  factory BookWorkSpaceResponse.fromJson(Map<String, dynamic> json) =>
      _$BookWorkSpaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookWorkSpaceResponseToJson(this);
}

@JsonSerializable()
class Client {
  final String? id;
  final User? user;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final Map<String, dynamic>? meta;
  final String? gender;

  Client({
    this.id,
    this.user,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.gender,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

@JsonSerializable()
class SubListing {
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
  final double? amount;
  final List<String>? features;
  final String? listing;

  SubListing({
    this.id,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.name,
    this.images,
    this.description,
    this.maxCapacity,
    this.amount,
    this.features,
    this.listing,
  });

  factory SubListing.fromJson(Map<String, dynamic> json) =>
      _$SubListingFromJson(json);

  Map<String, dynamic> toJson() => _$SubListingToJson(this);
}