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
      id: json['room_id'] as String?,
    );

Map<String, dynamic> _$WorkspaceRoomModelToJson(WorkspaceRoomModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'room_id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.maxCapacity case final value?) 'max_capacity': value,
      if (instance.features case final value?) 'features': value,
      if (instance.images case final value?) 'images': value,
      if (instance.amount case final value?) 'amount': value,
    };
