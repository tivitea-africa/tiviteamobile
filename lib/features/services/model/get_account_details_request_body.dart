import 'package:json_annotation/json_annotation.dart';

part 'get_account_details_request_body.g.dart';

@JsonSerializable()
class GetAccountDetailsRequestBody {
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  
  @JsonKey(name: 'bank_code')
  final String? bankCode;

  GetAccountDetailsRequestBody({
    this.accountNumber,
    this.bankCode,
  });

  factory GetAccountDetailsRequestBody.fromJson(Map<String, dynamic> json) => 
      _$GetAccountDetailsRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountDetailsRequestBodyToJson(this);
}