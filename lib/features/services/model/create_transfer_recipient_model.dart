import 'package:json_annotation/json_annotation.dart';

part 'create_transfer_recipient_model.g.dart';

@JsonSerializable()
class CreateTransferRecipientModel {
  @JsonKey(name: 'account_number')
  final String? accountNumber;

  final String? name;

  @JsonKey(name: 'bank_code')
  final String? bankCode;

  @JsonKey(name: 'foot_soldier_email')
  final String? footSoldierEmail;

  CreateTransferRecipientModel({
    this.accountNumber,
    this.name,
    this.bankCode,
    this.footSoldierEmail,
  });

  factory CreateTransferRecipientModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTransferRecipientModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTransferRecipientModelToJson(this);
}
