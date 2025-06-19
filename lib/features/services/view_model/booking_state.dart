import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/models/paginator_selector_model.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';

class BookingState {
  BookingState({
    required this.loadState,
    required this.bookingHistoryList,
    required this.bookingHistoryLoadstate,
    required this.generateTicketLoadState,
    required this.checkInCheckOutLoadState,
    this.paginatorSelectorModel,
    this.pageCache = const {},
  });
  factory BookingState.initial() {
    return BookingState(
      loadState: LoadState.idle,
      generateTicketLoadState: LoadState.loading,
      bookingHistoryList: [],
      bookingHistoryLoadstate: LoadState.loading,
      checkInCheckOutLoadState: LoadState.loading,
      pageCache: {},
    );
  }
  final LoadState loadState;
  final LoadState bookingHistoryLoadstate;
  final LoadState generateTicketLoadState;
  final LoadState checkInCheckOutLoadState;
  final List<BookingHistoryModel> bookingHistoryList;
  final PaginatorSelectorModel? paginatorSelectorModel;
  final Map<int, List<BookingHistoryModel>> pageCache;

  BookingState copyWith({
    LoadState? loadState,
    LoadState? bookingHistoryLoadstate,
    LoadState? generateTicketLoadState,
    LoadState? checkInCheckOutLoadState,
    List<BookingHistoryModel>? bookingHistoryList,
    PaginatorSelectorModel? paginatorSelectorModel,
    Map<int, List<BookingHistoryModel>>? pageCache,
  }) {
    return BookingState(
      loadState: loadState ?? this.loadState,
      bookingHistoryLoadstate: bookingHistoryLoadstate ?? this.bookingHistoryLoadstate,
      generateTicketLoadState: generateTicketLoadState ?? this.generateTicketLoadState,
      checkInCheckOutLoadState: checkInCheckOutLoadState ?? this.checkInCheckOutLoadState,
      bookingHistoryList: bookingHistoryList ?? this.bookingHistoryList,
      paginatorSelectorModel: paginatorSelectorModel ?? this.paginatorSelectorModel,
      pageCache: pageCache ?? this.pageCache,
    );
  }
}
