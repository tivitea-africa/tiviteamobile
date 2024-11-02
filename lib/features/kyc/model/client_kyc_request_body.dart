import 'package:json_annotation/json_annotation.dart';

part 'client_kyc_request_body.g.dart';

@JsonSerializable()
class ClientKYCRequestBody {
  @JsonKey(name: 'document_type')
  final String? documentType;

  @JsonKey(name: 'document_id')
  final String? documentId;

  @JsonKey(name: 'front_image')
  final String? frontImage;

  @JsonKey(name: 'back_image')
  final String? backImage;

  ClientKYCRequestBody({
    this.documentType,
    this.documentId,
    this.frontImage,
    this.backImage,
  });

  factory ClientKYCRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ClientKYCRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ClientKYCRequestBodyToJson(this);

  ClientKYCRequestBody copyWith({
    String? documentType,
    String? documentId,
    String? frontImage,
    String? backImage,
  }) {
    return ClientKYCRequestBody(
      documentType: documentType ?? this.documentType,
      documentId: documentId ?? this.documentId,
      frontImage: frontImage ?? this.frontImage,
      backImage: backImage ?? this.backImage,
    );
  }
}