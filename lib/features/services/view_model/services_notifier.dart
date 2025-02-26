import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
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
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(
        loadState: LoadState.success,
        categories: response.data?.results ?? [],
      );
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
    }
  }

  void getListing({int page = 1, bool loadmore = false}) async {
    if (loadmore) {
      state = state.copyWith(listingLoadState: LoadState.loadmore);
    }
    try {
      final response = await _repo.getListing(page);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      state = state.copyWith(listingLoadState: LoadState.success);
      if (response.data?.results?.isEmpty ?? false) {
        return;
      }
      final listings = response.data?.results ?? [];
      final hasMorePages =
          (response.data?.page ?? 0) < (response.data?.totalPages ?? 1);

      if (listings.isEmpty) {
        state = state.copyWith(
          listingLoadState: hasMorePages ? LoadState.success : LoadState.done,
        );
        return;
      }

      state = state.copyWith(
        listingLoadState: hasMorePages ? LoadState.success : LoadState.done,
        listing: loadmore ? [...state.listing, ...listings] : listings,
      );
    } catch (e) {
      state = state.copyWith(listingLoadState: LoadState.error);
    }
  }

  Future<ListingResponseModel?> getListingbyId(String listingId) async {
    try {
      final response = await _repo.getListingById(listingId);
      if (!response.isSuccess()) {
        throw response.error?.message ?? response.message ?? '';
      }
      return response.data;
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      return null;
    }
  }

  bool get isLoading => state.loadState == LoadState.loading;
}
