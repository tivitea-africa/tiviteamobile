import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  final String? id;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final Map<String, dynamic>? meta;
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  @JsonKey(name: 'postal_code')
  final String? postalCode;

  Address({
    this.id,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.street,
    this.city,
    this.state,
    this.country,
    this.postalCode,
  });

  /// Factory method for JSON deserialization
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}