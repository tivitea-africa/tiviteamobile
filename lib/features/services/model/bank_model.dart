import 'package:json_annotation/json_annotation.dart';

part 'bank_model.g.dart';

@JsonSerializable()
class ListBanksResponse {
  final String? status;
  final String? message;
  final List<BankModel>? data;

  ListBanksResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ListBanksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBanksResponseFromJson(json);
}

@JsonSerializable()
class BankModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? code;
  final String? longcode;
  final String? gateway;

  @JsonKey(name: 'pay_with_bank')
  final bool? payWithBank;

  @JsonKey(name: 'supports_transfer')
  final bool? supportsTransfer;

  final bool? active;
  final String? country;
  final String? currency;
  final String? type;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  final String? createdAt;
  final String? updatedAt;

  BankModel({
    this.id,
    this.name,
    this.slug,
    this.code,
    this.longcode,
    this.gateway,
    this.payWithBank,
    this.supportsTransfer,
    this.active,
    this.country,
    this.currency,
    this.type,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}
