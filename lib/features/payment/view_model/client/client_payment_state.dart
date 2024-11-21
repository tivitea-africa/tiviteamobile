import 'package:tivi_tea/core/utils/enums.dart';

class ClientPaymentNotifierState {
  ClientPaymentNotifierState({required this.createPaymentLoadState});
  factory ClientPaymentNotifierState.initial() {
    return ClientPaymentNotifierState(createPaymentLoadState: LoadState.idle);
  }
  final LoadState createPaymentLoadState;

  ClientPaymentNotifierState copyWith({LoadState? createPaymentLoadState}) {
    return ClientPaymentNotifierState(
      createPaymentLoadState:
          createPaymentLoadState ?? this.createPaymentLoadState,
    );
  }
}
