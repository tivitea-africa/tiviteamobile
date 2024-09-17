import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/models/address_model.dart';
import 'package:tivi_tea/models/user_model.dart';

part 'login_response_object.g.dart';

@JsonSerializable()
class LoginResponseObject {
  final String? id;
  final User? user;
  final Address? address;
  @JsonKey(name: 'date_created')
  final String? dateCreated;
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  final Map<String, dynamic>? meta;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'alternate_phone_number')
  final String? alternatePhoneNumber;
  @JsonKey(name: 'business_description')
  final String? businessDescription;
  final String? website;
  @JsonKey(name: 'business_type')
  final String? businessType;
  @JsonKey(name: 'foot_soldier')
  final String? footSoldier;
  final Tokens? tokens;

  LoginResponseObject({
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
    this.tokens,
  });

  factory LoginResponseObject.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseObjectFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseObjectToJson(this);
}

@JsonSerializable()
class Tokens {
  final String? refresh;
  final String? access;

  Tokens({
    this.refresh,
    this.access,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  Map<String, dynamic> toJson() => _$TokensToJson(this);
}
