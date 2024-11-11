import 'package:tivi_tea/core/utils/enums.dart';

class BookingState {
  BookingState({
    required this.loadState,
  });
  factory BookingState.initial() {
    return BookingState(
      loadState: LoadState.idle,
    );
  }
  final LoadState loadState;

  BookingState copyWith({LoadState? loadState}) {
    return BookingState(
      loadState: loadState ?? this.loadState,
    );
  }
}
