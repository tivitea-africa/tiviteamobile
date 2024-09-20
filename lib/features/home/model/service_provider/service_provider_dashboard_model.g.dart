// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceProviderDashboardModel _$ServiceProviderDashboardModelFromJson(
        Map<String, dynamic> json) =>
    ServiceProviderDashboardModel(
      totalBookings: json['total_bookings'] as num?,
      totalListings: json['total_listings'] as num?,
      barChart: json['bar_chart'] == null
          ? null
          : BarChart.fromJson(json['bar_chart'] as Map<String, dynamic>),
      totalRevenue: (json['total_revenue'] as num?)?.toDouble(),
      bookingSummary: json['booking_summary'] == null
          ? null
          : BookingSummary.fromJson(
              json['booking_summary'] as Map<String, dynamic>),
      bookingHistoryData: json['booking_history_data'] as List<dynamic>?,
    );

Map<String, dynamic> _$ServiceProviderDashboardModelToJson(
        ServiceProviderDashboardModel instance) =>
    <String, dynamic>{
      'total_bookings': instance.totalBookings,
      'total_listings': instance.totalListings,
      'bar_chart': instance.barChart,
      'total_revenue': instance.totalRevenue,
      'booking_summary': instance.bookingSummary,
      'booking_history_data': instance.bookingHistoryData,
    };

BarChart _$BarChartFromJson(Map<String, dynamic> json) => BarChart(
      thisYear:
          (json['this year'] as List<dynamic>?)?.map((e) => e as num).toList(),
      thisMonth:
          (json['this month'] as List<dynamic>?)?.map((e) => e as num).toList(),
      thisWeek:
          (json['this_week'] as List<dynamic>?)?.map((e) => e as num).toList(),
    );

Map<String, dynamic> _$BarChartToJson(BarChart instance) => <String, dynamic>{
      'this year': instance.thisYear,
      'this month': instance.thisMonth,
      'this_week': instance.thisWeek,
    };

BookingSummary _$BookingSummaryFromJson(Map<String, dynamic> json) =>
    BookingSummary(
      incoming: json['incoming'] as String?,
      ongoing: json['ongoing'] as String?,
      completed: json['completed'] as String?,
    );

Map<String, dynamic> _$BookingSummaryToJson(BookingSummary instance) =>
    <String, dynamic>{
      'incoming': instance.incoming,
      'ongoing': instance.ongoing,
      'completed': instance.completed,
    };
