import 'package:tivi_tea/core/utils/enums.dart';

class RegistrationState {
  RegistrationState({required this.loadState});
  factory RegistrationState.initial() {
    return RegistrationState(
      loadState: LoadState.idle,
    );
  }
  final LoadState loadState;

  RegistrationState copyWith({
    LoadState? loadState,
  }) {
    return RegistrationState(
      loadState: loadState ?? this.loadState,
    );
  }
}
