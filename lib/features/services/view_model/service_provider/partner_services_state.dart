import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';

class PartnerServicesState {
  PartnerServicesState({
    required this.listingLoadState,
    required this.postLoadState,
    required this.postWorkToolLoadState,
    required this.cloudinaryUploadState,
    required this.listing,
  });
  factory PartnerServicesState.initial() {
    return PartnerServicesState(
      listingLoadState: LoadState.loading,
      postLoadState: LoadState.idle,
      postWorkToolLoadState: LoadState.idle,
      cloudinaryUploadState: LoadState.idle,
      listing: [],
    );
  }
  final LoadState listingLoadState;
  final LoadState postLoadState;
  final LoadState postWorkToolLoadState;
  final LoadState cloudinaryUploadState;
  final List<ListingResponseModel> listing;

  PartnerServicesState copyWith({
    LoadState? listingLoadState,
    LoadState? postLoadState,
    LoadState? postWorkToolLoadState,
    LoadState? cloudinaryUploadState,
    List<ListingResponseModel>? listing,
  }) {
    return PartnerServicesState(
      listingLoadState: listingLoadState ?? this.listingLoadState,
      cloudinaryUploadState: cloudinaryUploadState ?? this.cloudinaryUploadState,
      postLoadState: postLoadState ?? this.postLoadState,
      postWorkToolLoadState: postWorkToolLoadState ?? this.postWorkToolLoadState,
      listing: listing ?? this.listing,
    );
  }
}