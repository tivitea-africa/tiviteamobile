import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';

import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/view_model/login_state.dart';
import 'package:tivi_tea/features/profile/model/change_password_model.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/features/registration/model/client/social_auth_model.dart';
import 'package:tivi_tea/models/enums/enums.dart';
import 'package:tivi_tea/repositories/authentication/general/general_authetication_repo.dart';
import 'package:tivi_tea/repositories/authentication/general/third_party_auth.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  late final GeneralAuthenticationRepo _repo;
  late final UserRepository _userRepo;
  late final ThirdPartyAuthRepo _thirdPartyAuthRepo;
  @override
  LoginState build() {
    _userRepo = ref.read(userRepositoryProvider);
    _repo = GeneralAuthenticationRepo(
      restClient: ref.read(restClient),
      userRepository: _userRepo,
    );
    _thirdPartyAuthRepo = ThirdPartyAuthRepo(
      googleSignIn: GoogleSignIn(),
    );
    return LoginState.initial();
  }

  void login(
    LoginRequestObject data, {
    ///Pass [EntityType] to determine what dashboard would be loaded
    void Function(EntityType?)? onSuccess,
    void Function(String)? onError,
  }) async {
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await _repo.login(
        data,
        saveUserState: (user) {
          final userStateNotifier = ref.read(userNotifierProvider.notifier);
          userStateNotifier.updateUser(user);
        },
      );
      if (!response.isSuccess()) {
        throw response.error?.message ??
            response.message ??
            'An error occurred';
      }
      state = state.copyWith(loadState: LoadState.success);
      if (onSuccess != null) onSuccess(response.data?.user?.entityType);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      if (onError != null) onError(e.toString());
    }
  }

  void signUpWithSocialAuth(
    SocialAuthModel data, {
    ///Pass [EntityType] to determine what dashboard would be loaded
    void Function(EntityType?)? onSuccess,
    void Function(String)? onError,
  }) async {
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await _repo.signUpWithSocialAuth(data);
      if (!response.isSuccess()) {
        throw response.error?.message ??
            response.message ??
            'An error occurred';
      }
      state = state.copyWith(loadState: LoadState.success);
      if (onSuccess != null) onSuccess(response.data?.user?.entityType);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      if (onError != null) onError(e.toString());
    }
  }

  void forgotPassword(
    ForgotPasswordRequestObject data, {
    VoidCallback? onSuccess,
    void Function(String)? onError,
  }) async {
    state = state.copyWith(forgotPasswordLoadState: LoadState.loading);
    try {
      final response = await _repo.forgotPassword(data);
      if (!response.isSuccess()) {
        throw response.error?.message ??
            response.message ??
            'An error occurred';
      }
      state = state.copyWith(forgotPasswordLoadState: LoadState.success);
      if (onSuccess != null) onSuccess();
    } catch (e) {
      state = state.copyWith(forgotPasswordLoadState: LoadState.error);
      if (onError != null) onError(e.toString());
    }
  }

  void changePassword(
    ChangePasswordModel data, {
    VoidCallback? onSuccess,
    void Function(String)? onError,
  }) async {
    state = state.copyWith(changePasswordLoadState: LoadState.loading);
    try {
      final response = await _repo.changePassword(data);
      if (!response.isSuccess()) {
        throw response.error?.message ??
            response.message ??
            'An error occurred';
      }
      state = state.copyWith(changePasswordLoadState: LoadState.success);
      if (onSuccess != null) onSuccess();
    } catch (e) {
      state = state.copyWith(changePasswordLoadState: LoadState.error);
      if (onError != null) onError(e.toString());
    }
  }

  void rememberUser(bool value) {
    _userRepo.saveRememberMe(value);
  }

  bool getRememberUserValue() {
    return _userRepo.getRememberMe() ?? false;
  }

  void logout({required VoidCallback onDataCleared}) {
    state = state.copyWith(logoutState: LoadState.loading);
    try {
      _repo.logout(onDataCleared: onDataCleared);
      state = state.copyWith(logoutState: LoadState.success);
    } catch (e) {
      state = state.copyWith(logoutState: LoadState.error);
    }
  }

  void signInWithGoogle({
    void Function(EntityType?)? onSuccess,
    void Function(String)? onError,
  }) async {
    state = state.copyWith(signInWithGoogleLoadState: LoadState.loading);
    final response = await _thirdPartyAuthRepo.signIn();
    if (response.isSuccess()) {
      if (response.data != null) {
        signUpWithSocialAuth(response.data!,
            onSuccess: onSuccess, onError: onError);
      }
      state = state.copyWith(signInWithGoogleLoadState: LoadState.success);
    } else {
      state = state.copyWith(signInWithGoogleLoadState: LoadState.error);
      if (onError != null) onError(response.message ?? 'An error occurred');
    }
  }

  void setAppAccessState(AppAccessState appAccessState) {
    state = state.copyWith(appAccessState: appAccessState);
  }
}
