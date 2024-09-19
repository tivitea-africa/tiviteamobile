import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';

import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/registration/model/client/customer_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/view_model/service_provider/registration_state.dart';
import 'package:tivi_tea/repositories/authentication/customer/customer_authentication_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

part 'customer_registration_notifier.g.dart';

@riverpod
class CustomerRegistrationNotifier extends _$CustomerRegistrationNotifier {
  late final CustomerAuthenticationRepo _repo;
  late final UserRepository _userRepo;

  @override
  RegistrationState build() {
    _userRepo = ref.read(userRepositoryProvider);
    _repo = CustomerAuthenticationRepo(
      restClient: ref.read(restClient),
      userRepository: _userRepo,
    );
    return RegistrationState.initial();
  }

  void signUpAsCustomer(
    CustomerSignUpRequestBody data, {
    Function(String)? onSuccess,
    void Function(String)? onError,
  }) async {
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await _repo.signUpAsCustomer(data);
      if (!response.isSuccess()) {
        throw response.error?.message ?? '';
      }
      state = state.copyWith(loadState: LoadState.success);
      if (onSuccess != null) onSuccess(response.message ?? '');
    } catch (e) {
      state = state.copyWith(loadState: LoadState.error);
      if (onError != null) onError(e.toString());
    }
  }
}
