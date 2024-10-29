import 'package:json_annotation/json_annotation.dart';

part 'partner_kyc_request_body.g.dart';

class KYCSecondViewParams {
  final String documentType;
  final String registrationNumber;
  final String imagePath;

  KYCSecondViewParams({
    required this.documentType,
    required this.registrationNumber,
    required this.imagePath,
  });
}

@JsonSerializable()
class PartnerKycRequestBody {
  @JsonKey(name: 'document_type')
  final String? documentType;

  @JsonKey(name: 'registration_number')
  final String? registrationNumber;

  @JsonKey(name: 'business_document_image')
  final String? businessDocumentImage;

  @JsonKey(name: 'utility_bill')
  final String? utilityBill;

  @JsonKey(name: 'utility_bill_image')
  final String? utilityBillImage;

  PartnerKycRequestBody({
    this.documentType,
    this.registrationNumber,
    this.businessDocumentImage,
    this.utilityBill,
    this.utilityBillImage,
  });

  factory PartnerKycRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PartnerKycRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerKycRequestBodyToJson(this);

  PartnerKycRequestBody copyWith({
    String? documentType,
    String? registrationNumber,
    String? businessDocumentImage,
    String? utilityBill,
    String? utilityBillImage,
  }) {
    return PartnerKycRequestBody(
      documentType: documentType ?? this.documentType,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      businessDocumentImage:
          businessDocumentImage ?? this.businessDocumentImage,
      utilityBill: utilityBill ?? this.utilityBill,
      utilityBillImage: utilityBillImage ?? this.utilityBillImage,
    );
  }
}
