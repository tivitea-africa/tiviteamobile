import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_request_body.dart';

class RegistrationState {
  RegistrationState({required this.loadState, this.requestBody});
  factory RegistrationState.initial() {
    return RegistrationState(
      loadState: LoadState.idle,
    );
  }
  final LoadState loadState;
  final ServiceProviderSignUpRequestBody? requestBody;

  RegistrationState copyWith({
    LoadState? loadState,
    ServiceProviderSignUpRequestBody? requestBody,
  }) {
    return RegistrationState(
      loadState: loadState ?? this.loadState,
      requestBody: requestBody ?? this.requestBody,
    );
  }
}
