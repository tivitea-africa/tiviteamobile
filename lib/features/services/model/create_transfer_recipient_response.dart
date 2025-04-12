import 'package:json_annotation/json_annotation.dart';

part 'create_transfer_recipient_response.g.dart';

@JsonSerializable()
class CreateTransferRecipientResponse {
  final String? id;
  
  final String? partner;
  
  @JsonKey(name: 'date_created')
  final String? dateCreated;
  
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  
  final Map<String, dynamic>? meta;
  
  @JsonKey(name: 'account_name')
  final String? accountName;
  
  @JsonKey(name: 'bank_code')
  final String? bankCode;
  
  @JsonKey(name: 'bank_name')
  final String? bankName;
  
  final String? type;
  
  final String? name;
  
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  
  final String? status;
  
  @JsonKey(name: 'recipient_code')
  final String? recipientCode;
  
  final String? reference;
  
  @JsonKey(name: 'foot_soldier')
  final String? footSoldier;

  CreateTransferRecipientResponse({
    this.id,
    this.partner,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.accountName,
    this.bankCode,
    this.bankName,
    this.type,
    this.name,
    this.accountNumber,
    this.status,
    this.recipientCode,
    this.reference,
    this.footSoldier,
  });

  factory CreateTransferRecipientResponse.fromJson(Map<String, dynamic> json) => 
      _$CreateTransferRecipientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTransferRecipientResponseToJson(this);
}