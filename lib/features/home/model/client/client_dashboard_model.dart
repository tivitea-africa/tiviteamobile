import 'package:json_annotation/json_annotation.dart';

part 'client_dashboard_model.g.dart';

@JsonSerializable()
class ClientDashboardModel {
  @JsonKey(name: 'total_bookings')
  final num? totalBookings;
  @JsonKey(name: 'upcoming_bookings')
  final num? upcomingBookings;
  final List<dynamic>? activities;

  ClientDashboardModel({
    this.totalBookings,
    this.upcomingBookings,
    this.activities,
  });

  factory ClientDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$ClientDashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientDashboardModelToJson(this);
}