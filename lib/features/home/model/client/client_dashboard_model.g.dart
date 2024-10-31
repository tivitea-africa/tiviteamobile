// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDashboardModel _$ClientDashboardModelFromJson(
        Map<String, dynamic> json) =>
    ClientDashboardModel(
      totalBookings: json['total_bookings'] as num?,
      upcomingBookings: json['upcoming_bookings'] as num?,
      activities: json['activities'] as List<dynamic>?,
    );

Map<String, dynamic> _$ClientDashboardModelToJson(
        ClientDashboardModel instance) =>
    <String, dynamic>{
      'total_bookings': instance.totalBookings,
      'upcoming_bookings': instance.upcomingBookings,
      'activities': instance.activities,
    };
