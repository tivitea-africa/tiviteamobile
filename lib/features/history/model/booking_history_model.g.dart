// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingHistoryModel _$BookingHistoryModelFromJson(Map<String, dynamic> json) =>
    BookingHistoryModel(
      id: json['id'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      listing: json['listing'] == null
          ? null
          : ListingResponseModel.fromJson(
              json['listing'] as Map<String, dynamic>),
      amount: json['amount'] as num?,
      status: json['status'] as String?,
      paymentStatus: json['payment_status'] as String?,
      paymentId: json['payment_id'] as String?,
    );

Map<String, dynamic> _$BookingHistoryModelToJson(
        BookingHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'listing': instance.listing,
      'amount': instance.amount,
      'status': instance.status,
      'payment_status': instance.paymentStatus,
      'payment_id': instance.paymentId,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
    };
