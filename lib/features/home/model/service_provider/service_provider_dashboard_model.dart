import 'package:json_annotation/json_annotation.dart';

part 'service_provider_dashboard_model.g.dart';

@JsonSerializable()
class ServiceProviderDashboardModel {
  @JsonKey(name: 'total_bookings')
  final num? totalBookings;
  @JsonKey(name: 'total_listings')
  final num? totalListings;
  @JsonKey(name: 'bar_chart')
  final BarChart? barChart;
  @JsonKey(name: 'total_revenue')
  final double? totalRevenue;
  @JsonKey(name: 'booking_summary')
  final BookingSummary? bookingSummary;
  @JsonKey(name: 'booking_history_data')
  final List<dynamic>? bookingHistoryData;

  ServiceProviderDashboardModel({
    this.totalBookings,
    this.totalListings,
    this.barChart,
    this.totalRevenue,
    this.bookingSummary,
    this.bookingHistoryData,
  });

  factory ServiceProviderDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderDashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceProviderDashboardModelToJson(this);
}

@JsonSerializable()
class BarChart {
  @JsonKey(name: 'this year')
  final List<num>? thisYear;

  @JsonKey(name: 'this month')
  final List<num>? thisMonth;

  @JsonKey(name: 'this_week')
  final List<num>? thisWeek;

  BarChart({
    this.thisYear,
    this.thisMonth,
    this.thisWeek,
  });

  factory BarChart.fromJson(Map<String, dynamic> json) =>
      _$BarChartFromJson(json);

  Map<String, dynamic> toJson() => _$BarChartToJson(this);
}

@JsonSerializable()
class BookingSummary {
  final String? incoming;
  final String? ongoing;
  final String? completed;

  BookingSummary({
    this.incoming,
    this.ongoing,
    this.completed,
  });

  factory BookingSummary.fromJson(Map<String, dynamic> json) =>
      _$BookingSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$BookingSummaryToJson(this);
}