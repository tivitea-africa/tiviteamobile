// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_foot_soldier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFootSoldierModel _$CreateFootSoldierModelFromJson(
        Map<String, dynamic> json) =>
    CreateFootSoldierModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$CreateFootSoldierModelToJson(
        CreateFootSoldierModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
    };
