// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_kyc_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerKycRequestBody _$PartnerKycRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PartnerKycRequestBody(
      documentType: json['document_type'] as String?,
      registrationNumber: json['registration_number'] as String?,
      businessDocumentImage: json['business_document_image'] as String?,
      utilityBill: json['utility_bill'] as String?,
      utilityBillImage: json['utility_bill_image'] as String?,
    );

Map<String, dynamic> _$PartnerKycRequestBodyToJson(
        PartnerKycRequestBody instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'registration_number': instance.registrationNumber,
      'business_document_image': instance.businessDocumentImage,
      'utility_bill': instance.utilityBill,
      'utility_bill_image': instance.utilityBillImage,
    };
