import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/payment/model/create_payment_response.dart';
import 'package:tivi_tea/features/payment/view_model/client/client_payment_state.dart';
import 'package:tivi_tea/repositories/payment/client/client_payment_repo.dart';

part 'client_payment_notifier.g.dart';

@riverpod
class ClientPaymentNotifier extends _$ClientPaymentNotifier {
  late ClientPaymentRepo _repo;

  @override
  ClientPaymentNotifierState build() {
    _repo = ClientPaymentRepo(
      restClient: ref.read(restClient),
    );

    return ClientPaymentNotifierState.initial();
  }

  void createPayment(
    String bookingId, {
    required Function(CreatePaymentResponse) onSuccess,
    required Function(String) onError,
  }) async {
    state = state.copyWith(createPaymentLoadState: LoadState.loading);
    try {
      final result = await _repo.createPayment(bookingId: bookingId);
      if (result.isSuccess() == false) throw result.message ?? '';

      state = state.copyWith(createPaymentLoadState: LoadState.success);
      if (result.data != null) {
        onSuccess(result.data!);
      }
    } catch (e) {
      state = state.copyWith(createPaymentLoadState: LoadState.error);
      onError(e.toString());
    }
  }
}
