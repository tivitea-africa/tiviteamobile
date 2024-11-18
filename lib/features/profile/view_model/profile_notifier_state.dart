import 'package:tivi_tea/core/utils/enums.dart';

class ProfileNotifierState {
  ProfileNotifierState({
    required this.profileLoadState,
    required this.editProfileLoadState,
    required this.profilePicLoadState,
  });
  factory ProfileNotifierState.initial() {
    return ProfileNotifierState(
      profileLoadState: LoadState.idle,
      editProfileLoadState: LoadState.idle,
      profilePicLoadState: LoadState.idle,
    );
  }
  final LoadState profileLoadState;
  final LoadState editProfileLoadState;
  final LoadState profilePicLoadState;

  ProfileNotifierState copyWith({
    LoadState? profileLoadState,
    LoadState? editProfileLoadState,
    LoadState? profilePicLoadState,
  }) {
    return ProfileNotifierState(
      profileLoadState: profileLoadState ?? this.profileLoadState,
      profilePicLoadState: profilePicLoadState ?? this.profilePicLoadState,
      editProfileLoadState: editProfileLoadState ?? this.editProfileLoadState,
    );
  }
}