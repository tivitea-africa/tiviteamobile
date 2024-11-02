import 'package:tivi_tea/core/utils/enums.dart';

class ClientKYCState {
  ClientKYCState({
    required this.kycLoadState,
  });
  factory ClientKYCState.initial() {
    return ClientKYCState(
      kycLoadState: LoadState.idle,
    );
  }
  final LoadState kycLoadState;

  ClientKYCState copyWith({
    LoadState? kycLoadState,
  }) {
    return ClientKYCState(
      kycLoadState: kycLoadState ?? this.kycLoadState,
    );
  }
}