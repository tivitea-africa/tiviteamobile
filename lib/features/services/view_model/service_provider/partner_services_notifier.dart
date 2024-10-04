import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_state.dart';
import 'package:tivi_tea/repositories/services/service_provider/service_provider_services_repo.dart';

part 'partner_services_notifier.g.dart';

@riverpod
class ServicesNotifer extends _$ServicesNotifer {
  late final ServiceProviderServicesRepo _repo;

  @override
  PartnerServicesState build() {
    _repo = ServiceProviderServicesRepo(restClient: ref.read(restClient));

    return PartnerServicesState.initial();
  }

  void getPartnerListing() async {
    try {
      final response = await _repo.getPartnerListing();
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(
        listingLoadState: LoadState.success,
        listing: response.data?.results ?? [],
      );
    } catch (e) {
      state = state.copyWith(listingLoadState: LoadState.error);
    }
  }

  bool get isLoading => state.listingLoadState == LoadState.loading;
}