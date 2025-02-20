import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';

class BookingState {
  BookingState({
    required this.loadState,
    required this.bookingHistoryList,
  });
  factory BookingState.initial() {
    return BookingState(
      loadState: LoadState.loading,
      bookingHistoryList: [],
    );
  }
  final LoadState loadState;
  final List<BookingHistoryModel> bookingHistoryList;

  BookingState copyWith({
    LoadState? loadState,
    List<BookingHistoryModel>? bookingHistoryList,
  }) {
    return BookingState(
      loadState: loadState ?? this.loadState,
      bookingHistoryList: bookingHistoryList ?? this.bookingHistoryList,
    );
  }
}
