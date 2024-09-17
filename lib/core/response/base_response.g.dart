// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      status: json['status'] as String,
      message: json['message'] as String?,
      error: json['error'] == null
          ? null
          : ErrorResponseObject.fromJson(json['error'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

ErrorResponseObject _$ErrorResponseObjectFromJson(Map<String, dynamic> json) =>
    ErrorResponseObject(
      reason: json['reason'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorResponseObjectToJson(
        ErrorResponseObject instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'message': instance.message,
    };
