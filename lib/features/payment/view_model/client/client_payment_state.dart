import 'package:tivi_tea/core/utils/enums.dart';

class ClientPaymentNotifierState {
  ClientPaymentNotifierState({
    required this.createPaymentLoadState,
    required this.getPaymentStatusLoadState,
    required this.generatePaymentReceiptLoadState,
    required this.paymentId,
  });
  factory ClientPaymentNotifierState.initial() {
    return ClientPaymentNotifierState(
      createPaymentLoadState: LoadState.idle,
      getPaymentStatusLoadState: LoadState.idle,
      generatePaymentReceiptLoadState: LoadState.idle,
      paymentId: ''
    );
  }
  final LoadState createPaymentLoadState;
  final LoadState getPaymentStatusLoadState;
  final LoadState generatePaymentReceiptLoadState;
  final String paymentId;

  ClientPaymentNotifierState copyWith({
    LoadState? createPaymentLoadState,
    LoadState? getPaymentStatusLoadState,
    LoadState? generatePaymentReceiptLoadState,
    String? paymentId,
  }) {
    return ClientPaymentNotifierState(
      createPaymentLoadState:
          createPaymentLoadState ?? this.createPaymentLoadState,
      getPaymentStatusLoadState:
          getPaymentStatusLoadState ?? this.getPaymentStatusLoadState,
      generatePaymentReceiptLoadState:
          generatePaymentReceiptLoadState ?? this.generatePaymentReceiptLoadState,
      paymentId: paymentId ?? this.paymentId,
    );
  }
}
