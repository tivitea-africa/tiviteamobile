import 'package:json_annotation/json_annotation.dart';

part 'create_payment_response.g.dart';

@JsonSerializable()
class CreatePaymentResponse {
  @JsonKey(name: 'authorization_url')
  final String? authorizationUrl;

  @JsonKey(name: 'access_code')
  final String? accessCode;

  final String? reference;

  CreatePaymentResponse({
    this.authorizationUrl,
    this.accessCode,
    this.reference,
  });

  factory CreatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentResponseToJson(this);
}

@JsonSerializable()
class PaymentCallbackResponse {
  final String? status;

  PaymentCallbackResponse({
    this.status,
  });

  factory PaymentCallbackResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentCallbackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCallbackResponseToJson(this);
}
