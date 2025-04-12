// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBanksResponse _$ListBanksResponseFromJson(Map<String, dynamic> json) =>
    ListBanksResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListBanksResponseToJson(ListBanksResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      code: json['code'] as String?,
      longcode: json['longcode'] as String?,
      gateway: json['gateway'] as String?,
      payWithBank: json['pay_with_bank'] as bool?,
      supportsTransfer: json['supports_transfer'] as bool?,
      active: json['active'] as bool?,
      country: json['country'] as String?,
      currency: json['currency'] as String?,
      type: json['type'] as String?,
      isDeleted: json['is_deleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'code': instance.code,
      'longcode': instance.longcode,
      'gateway': instance.gateway,
      'pay_with_bank': instance.payWithBank,
      'supports_transfer': instance.supportsTransfer,
      'active': instance.active,
      'country': instance.country,
      'currency': instance.currency,
      'type': instance.type,
      'is_deleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
