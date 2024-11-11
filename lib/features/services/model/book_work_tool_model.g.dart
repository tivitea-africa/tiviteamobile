// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_work_tool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookWorkToolModel _$BookWorkToolModelFromJson(Map<String, dynamic> json) =>
    BookWorkToolModel(
      pickUpDate: json['pick_up_date'] == null
          ? null
          : DateTime.parse(json['pick_up_date'] as String),
      returnDate: json['return_date'] == null
          ? null
          : DateTime.parse(json['return_date'] as String),
    );

Map<String, dynamic> _$BookWorkToolModelToJson(BookWorkToolModel instance) =>
    <String, dynamic>{
      'pick_up_date': instance.pickUpDate?.toIso8601String(),
      'return_date': instance.returnDate?.toIso8601String(),
    };
