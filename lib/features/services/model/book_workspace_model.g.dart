// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_workspace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookWorkSpaceModel _$BookWorkSpaceModelFromJson(Map<String, dynamic> json) =>
    BookWorkSpaceModel(
      pickUpDate: json['pick_up_date'] == null
          ? null
          : DateTime.parse(json['pick_up_date'] as String),
      returnDate: json['return_date'] == null
          ? null
          : DateTime.parse(json['return_date'] as String),
      numOfPeople: (json['num_of_people'] as num?)?.toInt(),
      subListingId: json['sub_listing_id'] as String?,
    );

Map<String, dynamic> _$BookWorkSpaceModelToJson(BookWorkSpaceModel instance) =>
    <String, dynamic>{
      'pick_up_date': instance.pickUpDate?.toIso8601String(),
      'return_date': instance.returnDate?.toIso8601String(),
      'num_of_people': instance.numOfPeople,
      'sub_listing_id': instance.subListingId,
    };
