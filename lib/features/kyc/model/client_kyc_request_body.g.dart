// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_kyc_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientKYCRequestBody _$ClientKYCRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ClientKYCRequestBody(
      documentType: json['document_type'] as String?,
      documentId: json['document_id'] as String?,
      frontImage: json['front_image'] as String?,
      backImage: json['back_image'] as String?,
    );

Map<String, dynamic> _$ClientKYCRequestBodyToJson(
        ClientKYCRequestBody instance) =>
    <String, dynamic>{
      'document_type': instance.documentType,
      'document_id': instance.documentId,
      'front_image': instance.frontImage,
      'back_image': instance.backImage,
    };
