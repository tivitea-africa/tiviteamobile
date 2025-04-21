// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkspaceRoomModel _$WorkspaceRoomModelFromJson(Map<String, dynamic> json) =>
    WorkspaceRoomModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      maxCapacity: (json['max_capacity'] as num?)?.toInt(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      amount: json['amount'] as num?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$WorkspaceRoomModelToJson(WorkspaceRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'max_capacity': instance.maxCapacity,
      'features': instance.features,
      'images': instance.images,
      'amount': instance.amount,
    };
