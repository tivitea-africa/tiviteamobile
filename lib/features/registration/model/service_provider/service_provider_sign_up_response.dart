import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/models/address_model.dart';
import 'package:tivi_tea/models/user_model.dart';

part 'service_provider_sign_up_response.g.dart';

@JsonSerializable()
class ServiceProviderSignUpResponse {
  final String? id;
  final User? user;
  final Address? address;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
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

  ServiceProviderSignUpResponse({
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

  /// Factory method for JSON deserialization
  factory ServiceProviderSignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderSignUpResponseFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$ServiceProviderSignUpResponseToJson(this);
}