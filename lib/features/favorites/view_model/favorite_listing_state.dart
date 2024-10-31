import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_model.dart';

class FavoriteListingState {
  FavoriteListingState({
    required this.favorites,
    required this.currentPage,
    required this.totalPages,
    required this.loadState,
  });

  factory FavoriteListingState.initial() {
    return FavoriteListingState(
      favorites: [],
      currentPage: 0,
      totalPages: 0,
      loadState: LoadState.loading,
    );
  }

  final List<FavoriteListingModel> favorites;
  final int currentPage;
  final int totalPages;
  final LoadState loadState;

  FavoriteListingState copyWith({
    List<FavoriteListingModel>? favorites,
    int? currentPage,
    int? totalPages,
    LoadState? loadState,
  }) {
    return FavoriteListingState(
      favorites: favorites ?? this.favorites,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      loadState: loadState ?? this.loadState,
    );
  }
}
