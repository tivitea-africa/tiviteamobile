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

  BookingSummaryParams copyWith({
    DateTime? selectedDateFrom,
    DateTime? selectedDateTo,
    ListingResponseModel? listing,
    String? roomId,
    int? numOfPeople,
  }) {
    return BookingSummaryParams(
      selectedDateFrom: selectedDateFrom ?? this.selectedDateFrom,
      selectedDateTo: selectedDateTo ?? this.selectedDateTo,
      listing: listing ?? this.listing,
      roomId: roomId ?? this.roomId,
      numOfPeople: numOfPeople ?? this.numOfPeople,
    );
  }
}

class ChooseRoomViewParams {
  final BookingSummaryParams? bookingSummaryParams;
  final List<Room> rooms;

  const ChooseRoomViewParams({
    required this.bookingSummaryParams,
    required this.rooms,
  });
  
}
