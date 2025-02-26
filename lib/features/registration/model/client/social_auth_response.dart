import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/login/model/general/login_response_object.dart';
import 'package:tivi_tea/models/enums/enums.dart';
import 'package:tivi_tea/models/user_model.dart';

part 'social_auth_response.g.dart';

@JsonSerializable()
class SocialAuthResponse {
  final String? id;
  final User? user;
  @JsonKey(name: 'date_created')
  final String? dateCreated;
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  @JsonKey(name: 'auth_provider')
  final String? authProvider;
  @JsonKey(name: 'auth_id')
  final String? authId;
  @JsonKey(name: 'kyc_is_verified')
  final bool? kycIsVerified;
  @JsonKey(name: 'favorite_listings')
  final List<String>? favoriteListings;
  final Tokens? tokens;
  @JsonKey(name: 'entity_type', defaultValue: EntityType.client)
  final EntityType? entityType;

  SocialAuthResponse({
    this.id,
    this.user,
    this.dateCreated,
    this.lastUpdated,
    this.authProvider,
    this.authId,
    this.kycIsVerified,
    this.favoriteListings,
    this.tokens,
    this.entityType,
  });

  factory SocialAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$SocialAuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SocialAuthResponseToJson(this);
}
