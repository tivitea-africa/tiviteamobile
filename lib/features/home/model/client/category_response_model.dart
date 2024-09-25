import 'package:json_annotation/json_annotation.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  final String? id;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final Map<String, dynamic>? meta;
  final String? name;
  final String? description;
  final bool isSelected;

  CategoryResponseModel({
    this.id,
    this.dateCreated,
    this.lastUpdated,
    this.meta,
    this.name,
    this.description,
    this.isSelected = false,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);

  CategoryResponseModel copyWith({
    String? id,
    DateTime? dateCreated,
    DateTime? lastUpdated,
    Map<String, dynamic>? meta,
    String? name,
    String? description,
    bool? isSelected,
  }) {
    return CategoryResponseModel(
      id: id ?? this.id,
      dateCreated: dateCreated ?? this.dateCreated,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      meta: meta ?? this.meta,
      name: name ?? this.name,
      description: description ?? this.description,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
