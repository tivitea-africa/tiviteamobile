import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';

part 'favorite_listing_model.g.dart';

@JsonSerializable()
class FavoriteListingModel {
  final String? id;
  final String? name;
  final String? description;
  final String? address;
  final List<String>? images;
  final num? amount;
  final double? rating;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool? isFavorited;

  FavoriteListingModel({
    this.id,
    this.name,
    this.description,
    this.address,
    this.images,
    this.amount,
    this.rating,
    this.isFavorited,
  });

  factory FavoriteListingModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListingModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteListingModelToJson(this);

  FavoriteListingModel copyWith({
    String? id,
    String? name,
    String? description,
    String? address,
    List<String>? images,
    num? amount,
    double? rating,
    bool? isFavorited,
  }) {
    return FavoriteListingModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      images: images ?? this.images,
      amount: amount ?? this.amount,
      rating: rating ?? this.rating,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }

  factory FavoriteListingModel.fromListingModel(ListingResponseModel listing) {
    return FavoriteListingModel(
      id: listing.id,
      name: listing.name,
      address: listing.address,
      amount: listing.amount,
      description: listing.description,
      images: listing.images,
      isFavorited: listing.isFavorites,
    );
  }
}