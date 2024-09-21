import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';

import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/view_model/login_state.dart';
import 'package:tivi_tea/models/enums/enums.dart';
import 'package:tivi_tea/repositories/authentication/general/general_authetication_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  late final GeneralAuthenticationRepo _repo;
  late final UserRepository _userRepo;

  @override
  LoginState build() {
    _userRepo = ref.read(userRepositoryProvider);
    _repo = GeneralAuthenticationRepo(
      restClient: ref.read(restClient),
      userRepository: _userRepo,
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
      final response = await _repo.login(data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
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
        throw response.error?.message ?? '';
      }
      state = state.copyWith(forgotPasswordLoadState: LoadState.success);
      if (onSuccess != null) onSuccess();
    } catch (e) {
      state = state.copyWith(forgotPasswordLoadState: LoadState.error);
      if (onError != null) onError(e.toString());
    }
  }

  void rememberUser(bool value) {
    _userRepo.saveRememberMe(value);
  }

  bool getRememberUserValue() {
    return _userRepo.getRememberMe() ?? false;
  }
}
