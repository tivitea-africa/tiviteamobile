import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/models/address_model.dart';

part 'service_provider_sign_up_request_body.g.dart';

@JsonSerializable()
class ServiceProviderSignUpRequestBody {
  final String? firstName;
  final String? lastName;
  final String? email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String? password;
  @JsonKey(name: 'confirm_password')
  final String? confirmPassword;
  @JsonKey(name: 'alternate_phone_number')
  final String? alternatePhoneNumber;
  @JsonKey(name: 'company_name')
  final String? companyName;
  final Address? address;
  @JsonKey(name: 'business_description')
  final String? businessDescription;
  @JsonKey(name: 'business_type')
  final String? businessType;

  ServiceProviderSignUpRequestBody({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
    this.alternatePhoneNumber,
    this.companyName,
    this.address,
    this.businessDescription,
    this.businessType,
  });

  factory ServiceProviderSignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderSignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceProviderSignUpRequestBodyToJson(this);
}