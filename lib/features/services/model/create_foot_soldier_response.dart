import 'package:json_annotation/json_annotation.dart';

part 'create_foot_soldier_response.g.dart';

@JsonSerializable()
class CreateFootSoldierResponse {
  final String? id;
  
  @JsonKey(name: 'date_created')
  final String? dateCreated;
  
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

  final Map<String, dynamic>? meta;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  final String? picture;

  final String? email;

  final String? status;

  final String? address;

  final String? partner;

  CreateFootSoldierResponse({
    this.id,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.picture,
    this.email,
    this.status,
    this.address,
    this.partner,
  });

  factory CreateFootSoldierResponse.fromJson(Map<String, dynamic> json) => 
      _$CreateFootSoldierResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFootSoldierResponseToJson(this);
}