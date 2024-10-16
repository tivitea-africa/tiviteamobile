import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/services/third_party_services/cloudinary_service.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/services/model/post_listing_model.dart';
import 'package:tivi_tea/features/services/model/post_worktool_model.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_state.dart';
import 'package:tivi_tea/repositories/services/service_provider/service_provider_services_repo.dart';

part 'partner_services_notifier.g.dart';

@riverpod
class PartnerServicesNotifer extends _$PartnerServicesNotifer {
  late final ServiceProviderServicesRepo _repo;
  late final CloudinaryService _cloudinaryService;

  @override
  PartnerServicesState build() {
    const String cloudName = 'tivitea';
    const String uploadPreset = 'hobmtu4o';

    _repo = ServiceProviderServicesRepo(restClient: ref.read(restClient));
    _cloudinaryService = CloudinaryService(
      cloudinary: CloudinaryPublic(
        cloudName,
        uploadPreset,
      ),
    );

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

  void postWorkSpace(
    PostListingModel model, {
    required VoidCallback onSuccess,
  }) async {
    state = state.copyWith(postLoadState: LoadState.loading);
    try {
      final response = await _repo.postWorkSpace(model);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(postLoadState: LoadState.success);
      onSuccess();
    } catch (e) {
      state = state.copyWith(postLoadState: LoadState.error);
    }
  }

  void postToolOrOtherListing(
    WorkToolListing model, {
    required VoidCallback onSuccess,
  }) async {
    state = state.copyWith(postWorkToolLoadState: LoadState.loading);
    try {
      final response = await _repo.postToolOrOtherListing(model);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(postWorkToolLoadState: LoadState.success);
      onSuccess();
    } catch (e) {
      state = state.copyWith(postWorkToolLoadState: LoadState.error);
    }
  }

  Future<List<String>> uploadImages(final List<XFile> imagePaths) async {
    state = state.copyWith(cloudinaryUploadState: LoadState.loading);
    try {
      final results = await _cloudinaryService.uploadImages(imagePaths);
      state = state.copyWith(cloudinaryUploadState: LoadState.success);
      return results;
    } catch (e) {
      return [];
    }
  }

  bool get isLoading => state.listingLoadState == LoadState.loading;
  bool get isPostUploading => state.postLoadState == LoadState.loading;
}
