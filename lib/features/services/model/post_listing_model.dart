import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';

part 'post_listing_model.g.dart';

@JsonSerializable(includeIfNull: false)
class PostListingModel {
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

  // @JsonKey(name: 'amount')
  // final num? amount;

  @JsonKey(name: 'amenities')
  final List<String>? amenities;

  @JsonKey(name: 'pricing_option')
  final String? pricingOption;

  @JsonKey(name: 'room')
  final List<WorkspaceRoomModel>? room;

  // @JsonKey(name: 'foot_soldier')
  // final String? footSoldier;

  PostListingModel({
    this.listingType,
    this.name,
    this.description,
    this.address,
    this.categoryId,
    this.images,
    //this.amount,
    this.amenities,
    this.pricingOption,
    this.room,
    //this.footSoldier,
  });

  factory PostListingModel.fromJson(Map<String, dynamic> json) =>
      _$PostListingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostListingModelToJson(this);

  // Map<String, dynamic> toJson() {
  //   final json = <String, dynamic>{};
  //   if (listingType != null) json['listing_type'] = listingType;
  //   if (name != null) json['name'] = name;
  //   if (description != null) json['description'] = description;
  //   if (address != null) json['address'] = address;
  //   if (categoryId != null) json['category_id'] = categoryId;
  //   if (images != null) json['images'] = images;
  //   if (amenities != null) json['amenities'] = amenities;
  //   if (pricingOption != null) json['pricing_option'] = pricingOption;
  //   if (room != null) json['room'] = room?.map((r) => r.toJson()).toList();
  //   return json;
  // }
}
