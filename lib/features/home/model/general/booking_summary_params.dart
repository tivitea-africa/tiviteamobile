import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';

class BookingSummaryParams {
  final DateTime selectedDateFrom;
  final DateTime selectedDateTo;
  final ListingResponseModel listing;
  final String? roomId;
  final int numOfPeople;

  const BookingSummaryParams({
    required this.selectedDateFrom,
    required this.selectedDateTo,
    required this.listing,
    this.numOfPeople = 0,
    this.roomId,
  });
}
