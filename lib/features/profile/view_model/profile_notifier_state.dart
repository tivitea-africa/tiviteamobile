import 'package:tivi_tea/core/utils/enums.dart';

class ProfileNotifierState {
  ProfileNotifierState({
    required this.profileLoadState,
  });
  factory ProfileNotifierState.initial() {
    return ProfileNotifierState(
      profileLoadState: LoadState.idle,
    );
  }
  final LoadState profileLoadState;

  ProfileNotifierState copyWith({
    LoadState? profileLoadState,
  }) {
    return ProfileNotifierState(
      profileLoadState: profileLoadState ?? this.profileLoadState,
    );
  }
}