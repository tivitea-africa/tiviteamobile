// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountDetailsResponse _$GetAccountDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAccountDetailsResponse(
      accountNumber: json['account_number'] as String?,
      accountName: json['account_name'] as String?,
      bankId: (json['bank_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetAccountDetailsResponseToJson(
        GetAccountDetailsResponse instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'bank_id': instance.bankId,
    };
