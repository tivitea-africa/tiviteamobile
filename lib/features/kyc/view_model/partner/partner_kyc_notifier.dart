import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/kyc/model/partner_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/view_model/partner/partner_kyc_state.dart';
import 'package:tivi_tea/repositories/services/service_provider/service_provider_services_repo.dart';

part 'partner_kyc_notifier.g.dart';

@riverpod
class PartnerKycNotifier extends _$PartnerKycNotifier {
  late final ServiceProviderServicesRepo _repo;

  @override
  PartnerKYCState build() {
    _repo = ServiceProviderServicesRepo(restClient: ref.read(restClient));

    return PartnerKYCState.initial();
  }

  void submitKYC(
    PartnerKycRequestBody data, {
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    state = state.copyWith(kycLoadState: LoadState.loading);
    try {
      final response = await _repo.submitKyc(data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      onSuccess();
      state = state.copyWith(kycLoadState: LoadState.success);
    } catch (e) {
      state = state.copyWith(kycLoadState: LoadState.error);
      onError(e.toString());
    }
  }
}
