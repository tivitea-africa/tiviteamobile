import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(includeToJson: false)
  final String? id;
  @JsonKey(name: 'date_created', includeToJson: false)
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated', includeToJson: false)
  final DateTime? lastUpdated;
  @JsonKey(includeToJson: false)
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

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
