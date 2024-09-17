import 'package:tivi_tea/core/utils/enums.dart';

class LoginState {
  LoginState({
    required this.loadState,
    required this.forgotPasswordLoadState,
  });
  factory LoginState.initial() {
    return LoginState(
      loadState: LoadState.idle,
      forgotPasswordLoadState: LoadState.idle,
    );
  }
  final LoadState loadState;
  final LoadState forgotPasswordLoadState;

  LoginState copyWith({
    LoadState? loadState,
    LoadState? forgotPasswordLoadState,
  }) {
    return LoginState(
      loadState: loadState ?? this.loadState,
      forgotPasswordLoadState:
          forgotPasswordLoadState ?? this.forgotPasswordLoadState,
    );
  }
}
