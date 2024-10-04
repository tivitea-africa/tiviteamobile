import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';

class PartnerServicesState {
  PartnerServicesState({
    required this.listingLoadState,
    required this.listing,
  });
  factory PartnerServicesState.initial() {
    return PartnerServicesState(
      listingLoadState: LoadState.loading,
      listing: [],
    );
  }
  final LoadState listingLoadState;
  final List<ListingResponseModel> listing;

  PartnerServicesState copyWith({
    LoadState? listingLoadState,
    List<ListingResponseModel>? listing,
  }) {
    return PartnerServicesState(
      listingLoadState: listingLoadState ?? this.listingLoadState,
      listing: listing ?? this.listing,
    );
  }
}