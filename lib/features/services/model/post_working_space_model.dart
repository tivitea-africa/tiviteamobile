import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';

part 'post_working_space_model.g.dart';

@JsonSerializable()
class PostWorkingSpaceModel {
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

  @JsonKey(name: 'amenities')
  final List<String>? amenities;

  @JsonKey(name: 'pricing_option')
  final String? pricingOption;

  @JsonKey(name: 'room')
  final List<WorkspaceRoomModel>? room;

  @JsonKey(name: 'foot_soldier')
  final String? footSoldier;

  PostWorkingSpaceModel({
    this.listingType,
    this.name,
    this.description,
    this.address,
    this.categoryId,
    this.images,
    this.amenities,
    this.pricingOption,
    this.room,
    this.footSoldier,
  });

  factory PostWorkingSpaceModel.fromJson(Map<String, dynamic> json) =>
      _$PostWorkingSpaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostWorkingSpaceModelToJson(this);
}