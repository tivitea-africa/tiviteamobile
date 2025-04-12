// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_details_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountDetailsRequestBody _$GetAccountDetailsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    GetAccountDetailsRequestBody(
      accountNumber: json['account_number'] as String?,
      bankCode: json['bank_code'] as String?,
    );

Map<String, dynamic> _$GetAccountDetailsRequestBodyToJson(
        GetAccountDetailsRequestBody instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'bank_code': instance.bankCode,
    };
