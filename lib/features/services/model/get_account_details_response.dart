import 'package:json_annotation/json_annotation.dart';

part 'get_account_details_response.g.dart';

@JsonSerializable()
class GetAccountDetailsResponse {
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  
  @JsonKey(name: 'account_name')
  final String? accountName;
  
  @JsonKey(name: 'bank_id')
  final int? bankId;

  GetAccountDetailsResponse({
    this.accountNumber,
    this.accountName,
    this.bankId,
  });

  factory GetAccountDetailsResponse.fromJson(Map<String, dynamic> json) => 
      _$GetAccountDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountDetailsResponseToJson(this);
}