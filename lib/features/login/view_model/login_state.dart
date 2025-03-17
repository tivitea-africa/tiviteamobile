import 'package:tivi_tea/core/utils/enums.dart';

class LoginState {
  LoginState({
    required this.loadState,
    required this.logoutState,
    required this.forgotPasswordLoadState,
    required this.changePasswordLoadState,
    required this.signInWithGoogleLoadState,
  });
  factory LoginState.initial() {
    return LoginState(
      loadState: LoadState.idle,
      logoutState: LoadState.idle,
      forgotPasswordLoadState: LoadState.idle,
      changePasswordLoadState: LoadState.idle,
      signInWithGoogleLoadState: LoadState.idle,
    );
  }
  final LoadState loadState;
  final LoadState logoutState;
  final LoadState forgotPasswordLoadState;
  final LoadState changePasswordLoadState;
  final LoadState signInWithGoogleLoadState;
  LoginState copyWith({
    LoadState? loadState,
    LoadState? logoutState,
    LoadState? forgotPasswordLoadState,
    LoadState? changePasswordLoadState,
    LoadState? signInWithGoogleLoadState,
  }) {
    return LoginState(
      loadState: loadState ?? this.loadState,
      logoutState: logoutState ?? this.logoutState,
      forgotPasswordLoadState:
          forgotPasswordLoadState ?? this.forgotPasswordLoadState,
      changePasswordLoadState:
          changePasswordLoadState ?? this.changePasswordLoadState,
      signInWithGoogleLoadState:
          signInWithGoogleLoadState ?? this.signInWithGoogleLoadState,
    );
  }
}
