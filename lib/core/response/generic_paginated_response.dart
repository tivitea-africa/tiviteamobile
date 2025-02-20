import 'package:json_annotation/json_annotation.dart';
part 'generic_paginated_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPaginatedResponse<T> {
  final List<T>? results;
  @JsonKey(fromJson: _pageFromJson, toJson: _pageToJson)
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

  static int? _pageFromJson(Object? json) {
    if (json == null) return null;
    return int.tryParse(json.toString());
  }

  static Object? _pageToJson(int? value) => value;

  factory GenericPaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$GenericPaginatedResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$GenericPaginatedResponseToJson(this, toJsonT);
}
