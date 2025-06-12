import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/services/rest_client/custom_rest_client_class.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/payment/model/create_payment_response.dart';
import 'package:tivi_tea/features/payment/view_model/client/client_payment_state.dart';
import 'package:tivi_tea/repositories/payment/client/client_payment_repo.dart';

part 'client_payment_notifier.g.dart';

@Riverpod(keepAlive: true)
class ClientPaymentNotifier extends _$ClientPaymentNotifier {
  late ClientPaymentRepo _repo;

  @override
  ClientPaymentNotifierState build() {
    _repo = ClientPaymentRepo(
      restClient: ref.read(restClient),
      customNetworkService: ref.read(networkServiceProvider),
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

      state = state.copyWith(
        createPaymentLoadState: LoadState.success,
        paymentId: result.data?.reference ?? '',
      );
      if (result.data != null) {
        onSuccess(result.data!);
      }
    } catch (e) {
      state = state.copyWith(createPaymentLoadState: LoadState.error);
      onError(e.toString());
    }
  }

  Future<void> getPaymentStatus(
    String paymentId, {
    required Function(bool, String?) onSuccess,
    required Function(String) onError,
  }) async {
    state = state.copyWith(getPaymentStatusLoadState: LoadState.loading);
    try {
      final result = await _repo.getPaymentStatus(paymentId: paymentId);
      if (result.isSuccess() == false) throw result.message ?? '';

      state = state.copyWith(getPaymentStatusLoadState: LoadState.success);
      if (result.data != null) {
        onSuccess(
          result.data?.status?.toLowerCase() == 'success',
          result.data?.status,
        );
      }
    } catch (e) {
      state = state.copyWith(getPaymentStatusLoadState: LoadState.error);
      onError(e.toString());
    }
  }

  void generatePaymentReceipt(
    String paymentId, {
    required Function(File) onSuccess,
    required Function(String) onError,
  }) async {
    state = state.copyWith(generatePaymentReceiptLoadState: LoadState.loading);
    try {
      final result = await _repo.generatePaymentReceipt(paymentId);
      if (result.isSuccess() == false) throw result.message ?? '';

      state =
          state.copyWith(generatePaymentReceiptLoadState: LoadState.success);
      if (result.data != null) {
        onSuccess(result.data!);
      }
    } catch (e) {
      state = state.copyWith(generatePaymentReceiptLoadState: LoadState.error);
      onError(e.toString());
    }
  }
}
