import 'package:json_annotation/json_annotation.dart';

part 'post_worktool_model.g.dart';

@JsonSerializable()
class WorkToolListing {
  @JsonKey(name: 'listing_type')
  final String? listingType;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'category_id')
  final String? categoryId;

  @JsonKey(name: 'images')
  final List<String>? images;

  @JsonKey(name: 'amount')
  final num? amount;

  @JsonKey(name: 'foot_soldier')
  final String? footSoldier;

  WorkToolListing({
    this.listingType,
    this.name,
    this.description,
    this.address,
    this.categoryId,
    this.images,
    this.amount,
    this.footSoldier,
  });

  factory WorkToolListing.fromJson(Map<String, dynamic> json) => _$WorkToolListingFromJson(json);

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (listingType != null) json['listing_type'] = listingType;
    if (name != null) json['name'] = name;
    if (description != null) json['description'] = description;
    if (address != null) json['address'] = address;
    if (categoryId != null) json['category_id'] = categoryId;
    if (images != null) json['images'] = images;
    if (amount != null) json['amount'] = amount;
    if (footSoldier != null) json['foot_soldier'] = footSoldier;
    return json;
  }
}