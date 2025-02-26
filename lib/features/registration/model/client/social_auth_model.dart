import 'package:json_annotation/json_annotation.dart';

part 'social_auth_model.g.dart';

@JsonSerializable()
class SocialAuthModel {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'auth_id')
  final String? authId;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  @JsonKey(name: 'auth_provider')
  final String? authProvider;

  SocialAuthModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.authId,
    this.profilePicture,
    this.authProvider,
  });

  factory SocialAuthModel.fromJson(Map<String, dynamic> json) =>
      _$SocialAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialAuthModelToJson(this);
}
