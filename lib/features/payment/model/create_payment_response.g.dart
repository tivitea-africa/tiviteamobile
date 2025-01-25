// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentResponse _$CreatePaymentResponseFromJson(
        Map<String, dynamic> json) =>
    CreatePaymentResponse(
      authorizationUrl: json['authorization_url'] as String?,
      accessCode: json['access_code'] as String?,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$CreatePaymentResponseToJson(
        CreatePaymentResponse instance) =>
    <String, dynamic>{
      'authorization_url': instance.authorizationUrl,
      'access_code': instance.accessCode,
      'reference': instance.reference,
    };

PaymentCallbackResponse _$PaymentCallbackResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentCallbackResponse(
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PaymentCallbackResponseToJson(
        PaymentCallbackResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
