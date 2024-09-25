// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericPaginatedResponse<T> _$GenericPaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GenericPaginatedResponse<T>(
      results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalItems: (json['total_items'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GenericPaginatedResponseToJson<T>(
  GenericPaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results?.map(toJsonT).toList(),
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_items': instance.totalItems,
    };
