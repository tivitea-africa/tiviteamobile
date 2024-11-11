import 'package:tivi_tea/core/utils/enums.dart';

class LoginState {
  LoginState({
    required this.loadState,
    required this.forgotPasswordLoadState,
    required this.changePasswordLoadState,
  });
  factory LoginState.initial() {
    return LoginState(
      loadState: LoadState.idle,
      forgotPasswordLoadState: LoadState.idle,
      changePasswordLoadState: LoadState.idle,
    );
  }
  final LoadState loadState;
  final LoadState forgotPasswordLoadState;
  final LoadState changePasswordLoadState;

  LoginState copyWith(
      {LoadState? loadState,
      LoadState? forgotPasswordLoadState,
      LoadState? changePasswordLoadState}) {
    return LoginState(
      loadState: loadState ?? this.loadState,
      forgotPasswordLoadState:
          forgotPasswordLoadState ?? this.forgotPasswordLoadState,
      changePasswordLoadState:
          changePasswordLoadState ?? this.changePasswordLoadState,
    );
  }
}
