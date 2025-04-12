import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/model/post_worktool_model.dart';

class PartnerServicesState {
  PartnerServicesState({
    required this.listingLoadState,
    required this.postLoadState,
    required this.postWorkToolLoadState,
    required this.cloudinaryUploadState,
    required this.createFootSoldierLoadState,
    required this.listing,
    this.savedWorkToolListing,
  });
  factory PartnerServicesState.initial() {
    return PartnerServicesState(
      listingLoadState: LoadState.loading,
      postLoadState: LoadState.idle,
      postWorkToolLoadState: LoadState.idle,
      cloudinaryUploadState: LoadState.idle,
      createFootSoldierLoadState: LoadState.idle,
      listing: [],
      savedWorkToolListing: null,
    );
  }
  final LoadState listingLoadState;
  final LoadState postLoadState;
  final LoadState postWorkToolLoadState;
  final LoadState cloudinaryUploadState;
  final LoadState createFootSoldierLoadState;
  final List<ListingResponseModel> listing;
  final WorkToolListing? savedWorkToolListing;

  PartnerServicesState copyWith({
    LoadState? listingLoadState,
    LoadState? postLoadState,
    LoadState? postWorkToolLoadState,
    LoadState? cloudinaryUploadState,
    LoadState? createFootSoldierLoadState,
    List<ListingResponseModel>? listing,
    WorkToolListing? savedWorkToolListing,
  }) {
    return PartnerServicesState(
      listingLoadState: listingLoadState ?? this.listingLoadState,
      cloudinaryUploadState: cloudinaryUploadState ?? this.cloudinaryUploadState,
      postLoadState: postLoadState ?? this.postLoadState,
      postWorkToolLoadState: postWorkToolLoadState ?? this.postWorkToolLoadState,
      createFootSoldierLoadState: createFootSoldierLoadState ?? this.createFootSoldierLoadState,
      listing: listing ?? this.listing,
      savedWorkToolListing: savedWorkToolListing ?? this.savedWorkToolListing,
    );
  }
}
