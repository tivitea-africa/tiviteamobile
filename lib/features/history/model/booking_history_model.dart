import 'package:json_annotation/json_annotation.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/models/user_model.dart';

part 'booking_history_model.g.dart';

@JsonSerializable()
class BookingHistoryModel {
  final String? id;
  final Client? client;
  final ListingResponseModel? listing;
  final num? amount;
  final String? status;
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @JsonKey(name: 'payment_id')
  final String? paymentId;

  BookingHistoryModel({
    this.id,
    this.client,
    this.listing,
    this.amount,
    this.status,
    this.paymentStatus,
    this.paymentId,
  });

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) => _$BookingHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingHistoryModelToJson(this);
}

@JsonSerializable()
class Client {
  final String? id;
  final User? user;

  Client({this.id, this.user});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
