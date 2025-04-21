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
    required this.editWorkToolLoadState,
    required this.deleteListingLoadState,
    required this.editWorkSpaceLoadState,
    required this.listing,
    this.savedWorkToolListing,
    this.selectedListing,
  });
  factory PartnerServicesState.initial() {
    return PartnerServicesState(
      listingLoadState: LoadState.loading,
      postLoadState: LoadState.idle,
      postWorkToolLoadState: LoadState.idle,
      cloudinaryUploadState: LoadState.idle,
      createFootSoldierLoadState: LoadState.idle,
      editWorkToolLoadState: LoadState.idle,
      deleteListingLoadState: LoadState.idle,
      editWorkSpaceLoadState: LoadState.idle,
      listing: [],
      savedWorkToolListing: null,
    );
  }
  final LoadState listingLoadState;
  final LoadState postLoadState;
  final LoadState postWorkToolLoadState;
  final LoadState cloudinaryUploadState;
  final LoadState createFootSoldierLoadState;
  final LoadState editWorkToolLoadState;
  final LoadState deleteListingLoadState;
  final List<ListingResponseModel> listing;
  final ListingResponseModel? selectedListing;
  final WorkToolListing? savedWorkToolListing;
  final LoadState editWorkSpaceLoadState;
  PartnerServicesState copyWith({
    LoadState? listingLoadState,
    LoadState? postLoadState,
    LoadState? postWorkToolLoadState,
    LoadState? cloudinaryUploadState,
    LoadState? createFootSoldierLoadState,
    LoadState? editWorkToolLoadState,
    LoadState? editWorkSpaceLoadState,
    List<ListingResponseModel>? listing,
    WorkToolListing? savedWorkToolListing,
    ListingResponseModel? selectedListing,
    LoadState? deleteListingLoadState,
  }) {
    return PartnerServicesState(
      listingLoadState: listingLoadState ?? this.listingLoadState,
      cloudinaryUploadState:
          cloudinaryUploadState ?? this.cloudinaryUploadState,
      postLoadState: postLoadState ?? this.postLoadState,
      postWorkToolLoadState:
          postWorkToolLoadState ?? this.postWorkToolLoadState,
      createFootSoldierLoadState:
          createFootSoldierLoadState ?? this.createFootSoldierLoadState,
      editWorkToolLoadState:
          editWorkToolLoadState ?? this.editWorkToolLoadState,
      editWorkSpaceLoadState:
          editWorkSpaceLoadState ?? this.editWorkSpaceLoadState,
      listing: listing ?? this.listing,
      savedWorkToolListing: savedWorkToolListing ?? this.savedWorkToolListing,
      deleteListingLoadState:
          deleteListingLoadState ?? this.deleteListingLoadState,
      selectedListing: selectedListing ?? this.selectedListing,
    );
  }
}
