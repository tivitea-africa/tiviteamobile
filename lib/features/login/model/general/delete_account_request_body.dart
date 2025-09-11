import 'package:json_annotation/json_annotation.dart';

part 'delete_account_request_body.g.dart';

@JsonSerializable()
class DeleteAccountRequestBody {
  @JsonKey(name: 'refresh')
  final String refresh;

  DeleteAccountRequestBody({
    required this.refresh,
  });

  factory DeleteAccountRequestBody.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAccountRequestBodyToJson(this);
}
