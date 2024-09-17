import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';

import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/view_model/service_provider/registration_state.dart';
import 'package:tivi_tea/repositories/authentication/service_provider/service_provider_authentication_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'registration_notifier.g.dart';

@riverpod
class RegistrationNotifier extends _$RegistrationNotifier {
  late final ServiceProviderAuthenticationRepo _repo;
  late final UserRepository _userRepo;

  @override
  RegistrationState build() {
    _userRepo = ref.read(userRepositoryProvider);
    _repo = ServiceProviderAuthenticationRepo(
      restClient: ref.read(restClient),
      userRepository: _userRepo,
    );
    return RegistrationState.initial();
  }

  void signUpAsServiceProvider(
    ServiceProviderSignUpRequestBody data, {
    VoidCallback? onSuccess,
    void Function(String)? onError,
  }) async {
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await _repo.signUpAsServiceProvider(data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(loadState: LoadState.success);
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      if (onError != null) onError(e.toString());
    }
  }

  void saveFirstViewRegistrationDetails(
    ServiceProviderSignUpRequestBody data,
  ) {
    state = state.copyWith(requestBody: data);
  }
}
