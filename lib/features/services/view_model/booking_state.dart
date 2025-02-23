import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';

class BookingState {
  BookingState({
    required this.loadState,
    required this.bookingHistoryList,
    required this.bookingHistoryLoadstate,
    required this.generateTicketLoadState,
  });
  factory BookingState.initial() {
    return BookingState(
      loadState: LoadState.idle,
      generateTicketLoadState: LoadState.loading,
      bookingHistoryList: [],
      bookingHistoryLoadstate: LoadState.loading,
    );
  }
  final LoadState loadState;
  final LoadState bookingHistoryLoadstate;
  final LoadState generateTicketLoadState;
  final List<BookingHistoryModel> bookingHistoryList;

  BookingState copyWith({
    LoadState? loadState,
    LoadState? bookingHistoryLoadstate,
    LoadState? generateTicketLoadState,
    List<BookingHistoryModel>? bookingHistoryList,
  }) {
    return BookingState(
      loadState: loadState ?? this.loadState,
      bookingHistoryLoadstate: bookingHistoryLoadstate ?? this.bookingHistoryLoadstate,
      generateTicketLoadState: generateTicketLoadState ?? this.generateTicketLoadState,
      bookingHistoryList: bookingHistoryList ?? this.bookingHistoryList,
    );
  }
}
