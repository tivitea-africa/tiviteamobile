import 'package:tivi_tea/core/utils/enums.dart';

enum AppAccessState { guest, user }

class LoginState {
  LoginState({
    required this.loadState,
    required this.appAccessState,
    required this.logoutState,
    required this.forgotPasswordLoadState,
    required this.changePasswordLoadState,
    required this.signInWithGoogleLoadState,
  });
  factory LoginState.initial() {
    return LoginState(
      loadState: LoadState.idle,
      appAccessState: AppAccessState.guest,
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
  final AppAccessState appAccessState;
  LoginState copyWith({
    LoadState? loadState,
    LoadState? logoutState,
    LoadState? forgotPasswordLoadState,
    LoadState? changePasswordLoadState,
    LoadState? signInWithGoogleLoadState,
    AppAccessState? appAccessState,
  }) {
    return LoginState(
      loadState: loadState ?? this.loadState,
      appAccessState: appAccessState ?? this.appAccessState,
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
