import 'package:tivi_tea/core/utils/enums.dart';

class PartnerKYCState {
  PartnerKYCState({
    required this.kycLoadState,
  });
  factory PartnerKYCState.initial() {
    return PartnerKYCState(
      kycLoadState: LoadState.idle,
    );
  }
  final LoadState kycLoadState;

  PartnerKYCState copyWith({
    LoadState? kycLoadState,
  }) {
    return PartnerKYCState(
      kycLoadState: kycLoadState ?? this.kycLoadState,
    );
  }
}