// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transfer_recipient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTransferRecipientResponse _$CreateTransferRecipientResponseFromJson(
        Map<String, dynamic> json) =>
    CreateTransferRecipientResponse(
      id: json['id'] as String?,
      partner: json['partner'] as String?,
      dateCreated: json['date_created'] as String?,
      lastUpdated: json['last_updated'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
      accountName: json['account_name'] as String?,
      bankCode: json['bank_code'] as String?,
      bankName: json['bank_name'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      accountNumber: json['account_number'] as String?,
      status: json['status'] as String?,
      recipientCode: json['recipient_code'] as String?,
      reference: json['reference'] as String?,
      footSoldier: json['foot_soldier'] as String?,
    );

Map<String, dynamic> _$CreateTransferRecipientResponseToJson(
        CreateTransferRecipientResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partner': instance.partner,
      'date_created': instance.dateCreated,
      'last_updated': instance.lastUpdated,
      'meta': instance.meta,
      'account_name': instance.accountName,
      'bank_code': instance.bankCode,
      'bank_name': instance.bankName,
      'type': instance.type,
      'name': instance.name,
      'account_number': instance.accountNumber,
      'status': instance.status,
      'recipient_code': instance.recipientCode,
      'reference': instance.reference,
      'foot_soldier': instance.footSoldier,
    };
