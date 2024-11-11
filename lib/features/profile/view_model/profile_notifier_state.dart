import 'package:tivi_tea/core/utils/enums.dart';

class ProfileNotifierState {
  ProfileNotifierState({
    required this.profileLoadState,
    required this.editProfileLoadState,
  });
  factory ProfileNotifierState.initial() {
    return ProfileNotifierState(
      profileLoadState: LoadState.idle,
      editProfileLoadState: LoadState.idle
    );
  }
  final LoadState profileLoadState;
  final LoadState editProfileLoadState;

  ProfileNotifierState copyWith({
    LoadState? profileLoadState,
    LoadState? editProfileLoadState,
  }) {
    return ProfileNotifierState(
      profileLoadState: profileLoadState ?? this.profileLoadState,
      editProfileLoadState: editProfileLoadState ?? this.editProfileLoadState,
    );
  }
}