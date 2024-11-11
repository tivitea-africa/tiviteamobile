import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/profile/model/edit_profile_model.dart';
import 'package:tivi_tea/features/profile/view_model/profile_notifier_state.dart';
import 'package:tivi_tea/repositories/dashboard/general_dashboard_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'profile_notifer.g.dart';

@riverpod
class ProfileNotifer extends _$ProfileNotifer {
  late GeneralDashboardRepo _repo;

  @override
  ProfileNotifierState build() {
    _repo = GeneralDashboardRepo(
      restClient: ref.read(restClient),
      userRepository: ref.read(userRepositoryProvider),
    );
    return ProfileNotifierState.initial();
  }

  void getUserProfile() async {
    state = state.copyWith(profileLoadState: LoadState.loading);
    try {
      final result = await _repo.getUserProfile();
      if (result.isSuccess() == false) throw result.message ?? '';
      state = state.copyWith(profileLoadState: LoadState.success);
    } catch (e) {
      state = state.copyWith(profileLoadState: LoadState.error);
    }
  }

  void updateProfile(
    EditProfileModel data, {
    required VoidCallback onSucess,
    required Function(String) onError,
  }) async {
    state = state.copyWith(editProfileLoadState: LoadState.loading);
    try {
      final result = await _repo.updateUserProfile(data);
      if (result.isSuccess() == false) throw result.message ?? '';
      state = state.copyWith(editProfileLoadState: LoadState.success);
      onSucess();
    } catch (e) {
      state = state.copyWith(editProfileLoadState: LoadState.error);
      onError(e.toString());
    }
  }
}
