// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_foot_soldier_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFootSoldierResponse _$CreateFootSoldierResponseFromJson(
        Map<String, dynamic> json) =>
    CreateFootSoldierResponse(
      id: json['id'] as String?,
      dateCreated: json['date_created'] as String?,
      lastUpdated: json['last_updated'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      picture: json['picture'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      address: json['address'] as String?,
      partner: json['partner'] as String?,
    );

Map<String, dynamic> _$CreateFootSoldierResponseToJson(
        CreateFootSoldierResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_created': instance.dateCreated,
      'last_updated': instance.lastUpdated,
      'meta': instance.meta,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'picture': instance.picture,
      'email': instance.email,
      'status': instance.status,
      'address': instance.address,
      'partner': instance.partner,
    };
