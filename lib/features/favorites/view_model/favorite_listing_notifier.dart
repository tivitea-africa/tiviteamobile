import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage_impl.dart';
import 'package:tivi_tea/core/services/local_storage/storage_keys.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/favorites/model/enums.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_model.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_request_body.dart';
import 'package:tivi_tea/features/favorites/view_model/favorite_listing_state.dart';
import 'package:tivi_tea/repositories/dashboard/client/client_dashboard_repo.dart';

part 'favorite_listing_notifier.g.dart';

@Riverpod(keepAlive: true)
class FavoriteListingNotifier extends _$FavoriteListingNotifier {
  late LocalStorage _localStorage;
  late ClientDashBoardRepo _repo;

  @override
  FavoriteListingState build() {
    _localStorage = ref.read(localDB);
    _repo = ClientDashBoardRepo(restClient: ref.read(restClient));

    //_fetchFavoritesFromBackend();

    return FavoriteListingState.initial();
  }

  void _fetchFavoritesFromBackend() async {
    try {
      final response = await _repo.getFavoriteListings();
      final favoriteListings = response.data?.results ?? [];

      await _addToDB(favoriteListings);

      state = state.copyWith(
        favorites: favoriteListings,
        currentPage: response.data?.page ?? 0,
        totalPages: response.data?.totalPages ?? 1,
        loadState: LoadState.success,
      );
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      debugLog(e.toString());
    }
  }

  Future<void> loadNextPage() async {
    if (state.currentPage >= state.totalPages ||
        (state.loadState == LoadState.loadmore)) return;

    state = state.copyWith(loadState: LoadState.loadmore);
    try {
      final nextPage = state.currentPage + 1;
      final response = await _repo.getFavoriteListings(page: nextPage);

      final List<FavoriteListingModel> updatedFavorites = [
        ...state.favorites,
        ...response.data?.results
                ?.map((item) => FavoriteListingModel.fromJson(item.toJson()))
                .toList() ??
            [],
      ];

      await _addToDB(updatedFavorites);
      //getFavoriteListings();

      state = state.copyWith(
        favorites: updatedFavorites,
        currentPage: nextPage,
        totalPages: response.data?.totalPages ?? state.totalPages,
        loadState: LoadState.success,
      );
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
    }
  }

  Future<void> _addToDB(List<FavoriteListingModel> favoriteListings) async {
    final encodedFavorites = jsonEncode(
      favoriteListings.map((favorite) => favorite.toJson()).toList(),
    );
    await _localStorage.put(HiveKeys.favoriteListing, encodedFavorites);
  }

  void getFavoriteListings() {
    try {
      final result = _localStorage.get(HiveKeys.favoriteListing);
      final decodedResult = List.from(jsonDecode(result)).toList();
      final List<FavoriteListingModel> favorites = decodedResult
          .map((json) => FavoriteListingModel.fromJson(json))
          .toList();

      state = state.copyWith(favorites: favorites);
    } catch (e) {
      state = state.copyWith(favorites: state.favorites);
    }
  }

  Future<void> toggleFavoriteStatus(
    FavoriteListingModel listing, {
    VoidCallback? onSuccess,
  }) async {
    try {
      final result = _localStorage.get(HiveKeys.favoriteListing);
      List<FavoriteListingModel> favorites = [];

      if (result != null) {
        final decodedResult =
            List<Map<String, dynamic>>.from(jsonDecode(result));
        favorites = decodedResult
            .map((json) => FavoriteListingModel.fromJson(json))
            .toList();
      }

      final isFavorited = favorites.any((fav) => fav.id == listing.id);
      final action =
          isFavorited ? FavoriteActionType.remove : FavoriteActionType.add;
      final updatedListingObject = listing.copyWith(isFavorited: !isFavorited);

      if (isFavorited) {
        favorites.removeWhere((fav) => fav.id == listing.id);
      } else {
        favorites.add(updatedListingObject);
      }

      await _addToDB(favorites);
      state = state.copyWith(favorites: favorites);

      final requestBody = FavoriteListingRequestBody(
        listingId: listing.id,
        action: action,
      );

      final response = await _repo.favoriteListing(requestBody);
      if (response.isSuccess() == false) throw response.message ?? '';

      if (onSuccess != null) onSuccess();
    } catch (e, s) {
      debugLog("Error updating favorite status: $e");
      debugLog("Stacktrace: $s");
    }
  }
}
