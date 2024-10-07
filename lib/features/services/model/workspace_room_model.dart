import 'package:json_annotation/json_annotation.dart';

part 'workspace_room_model.g.dart';

@JsonSerializable()
class WorkspaceRoomModel {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'max_capacity')
  final int? maxCapacity;

  @JsonKey(name: 'images')
  final List<String>? images;

  @JsonKey(name: 'amount')
  final double? amount;

  WorkspaceRoomModel({
    this.name,
    this.description,
    this.maxCapacity,
    this.images,
    this.amount,
  });

  factory WorkspaceRoomModel.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceRoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspaceRoomModelToJson(this);

  @override
  String toString() {
    return 'WorkspaceRoomModel{name: $name, description: $description, '
        'maxCapacity: $maxCapacity, images: $images, amount: $amount}';
  }
}
