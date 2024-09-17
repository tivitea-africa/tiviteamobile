import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  final int? code;
  final String status;
  final String? message;
  final ErrorResponseObject? error;
  final T? data;

  const BaseResponse({
    this.data,
    required this.status,
    this.message,
    this.error,
    this.code,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  bool isSuccess() => this.status.toLowerCase() == "success";
}

@JsonSerializable()
class ErrorResponseObject {
  final String? reason;
  final String? message;

  ErrorResponseObject({this.reason, this.message});

  factory ErrorResponseObject.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseObjectToJson(this);
}
