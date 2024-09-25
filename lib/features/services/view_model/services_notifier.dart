import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/services/view_model/services_state.dart';
import 'package:tivi_tea/repositories/services/general/general_services_repo.dart';

part 'services_notifier.g.dart';

@riverpod
class ServicesNotifer extends _$ServicesNotifer {
  late final GeneralServicesRepo _repo;

  @override
  ServicesState build() {
    _repo = GeneralServicesRepo(restClient: ref.read(restClient));

    return ServicesState.initial();
  }

  void getCategories() async {
    try {
      final response = await _repo.getCategories();
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(
        loadState: LoadState.success,
        categories: response.data?.results ?? [],
      );
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
    }
  }

  void getListing() async {
    try {
      final response = await _repo.getListing();
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(
        loadState: LoadState.success,
        listing: response.data?.results ?? [],
      );
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
    }
  }

  bool get isLoading => state.loadState == LoadState.loading;
}
