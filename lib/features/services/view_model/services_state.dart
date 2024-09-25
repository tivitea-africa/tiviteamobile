import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/home/model/client/category_response_model.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';

class ServicesState {
  ServicesState({
    required this.loadState,
    required this.listingLoadState,
    required this.listing,
    required this.categories,
  });
  factory ServicesState.initial() {
    return ServicesState(
      loadState: LoadState.loading,
      listingLoadState: LoadState.loading,
      categories: [],
      listing: [],
    );
  }
  final LoadState loadState;
  final LoadState listingLoadState;
  final List<CategoryResponseModel> categories;
  final List<ListingResponseModel> listing;

  ServicesState copyWith({
    LoadState? loadState,
    LoadState? listingLoadState,
    List<CategoryResponseModel>? categories,
    List<ListingResponseModel>? listing,
  }) {
    return ServicesState(
      loadState: loadState ?? this.loadState,
      categories: categories ?? this.categories,
      listingLoadState: listingLoadState ?? this.listingLoadState,
      listing: listing ?? this.listing,
    );
  }
}
