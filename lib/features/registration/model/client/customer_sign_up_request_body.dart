import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/models/user_model.dart';

part 'customer_sign_up_request_body.g.dart';

@JsonSerializable()
class CustomerSignUpRequestBody {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String? password;
  @JsonKey(name: 'confirm_password')
  final String? confirmPassword;

  CustomerSignUpRequestBody({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
  });

  factory CustomerSignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CustomerSignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerSignUpRequestBodyToJson(this);
}

@JsonSerializable()
class CustomerSignUpResponseBody {
  final String? id;
  final User? user;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final Map<String, dynamic>? meta;
  @JsonKey(name: 'auth_provider')
  final String? authProvider;
  @JsonKey(name: 'auth_id')
  final String? authId;
  @JsonKey(name: 'favorite_listings')
  final List<String>? favoriteListings;

  CustomerSignUpResponseBody({
    this.id,
    this.user,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.authProvider,
    this.authId,
    this.favoriteListings,
  });

  factory CustomerSignUpResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CustomerSignUpResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerSignUpResponseBodyToJson(this);
}
