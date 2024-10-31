import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/favorites/model/enums.dart';

part 'favorite_listing_request_body.g.dart';

@JsonSerializable()
class FavoriteListingRequestBody {
  @JsonKey(name: 'listing_id')
  final String? listingId;

  @JsonKey(defaultValue: FavoriteActionType.add)
  final FavoriteActionType? action;

  FavoriteListingRequestBody({
    this.listingId,
    this.action,
  });

  factory FavoriteListingRequestBody.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListingRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteListingRequestBodyToJson(this);

  FavoriteListingRequestBody copyWith({
    String? listingId,
    FavoriteActionType? action,
  }) {
    return FavoriteListingRequestBody(
      listingId: listingId ?? this.listingId,
      action: action ?? this.action,
    );
  }
}
