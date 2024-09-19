import 'package:tivi_tea/core/utils/enums.dart';

class CustomerRegistrationState {
  CustomerRegistrationState({required this.loadState});
  factory CustomerRegistrationState.initial() {
    return CustomerRegistrationState(
      loadState: LoadState.idle,
    );
  }
  final LoadState loadState;

  CustomerRegistrationState copyWith({
    LoadState? loadState,
  }) {
    return CustomerRegistrationState(
      loadState: loadState ?? this.loadState,
    );
  }
}
