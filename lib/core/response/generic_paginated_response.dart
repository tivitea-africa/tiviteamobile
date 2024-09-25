import 'package:json_annotation/json_annotation.dart';
part 'generic_paginated_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPaginatedResponse<T> {
  final List<T>? results;
  final int? page;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_items')
  final int? totalItems;

  GenericPaginatedResponse({
    this.results,
    this.page,
    this.totalPages,
    this.totalItems,
  });

  factory GenericPaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$GenericPaginatedResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$GenericPaginatedResponseToJson(this, toJsonT);
}
