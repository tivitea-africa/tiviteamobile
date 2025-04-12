// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transfer_recipient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTransferRecipientModel _$CreateTransferRecipientModelFromJson(
        Map<String, dynamic> json) =>
    CreateTransferRecipientModel(
      accountNumber: json['account_number'] as String?,
      name: json['name'] as String?,
      bankCode: json['bank_code'] as String?,
      footSoldierEmail: json['foot_soldier_email'] as String?,
    );

Map<String, dynamic> _$CreateTransferRecipientModelToJson(
        CreateTransferRecipientModel instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'name': instance.name,
      'bank_code': instance.bankCode,
      'foot_soldier_email': instance.footSoldierEmail,
    };
