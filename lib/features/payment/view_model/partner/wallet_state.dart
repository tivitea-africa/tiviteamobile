import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/payment/model/wallet_details_model.dart';

class WalletState {
  final LoadState getWalletDetailsState;
  final WalletDetailsModel? walletDetails;
  final LoadState createTransactionPinState;
  final LoadState withdrawFromWalletState;

  WalletState({
    this.walletDetails,
    required this.getWalletDetailsState,
    required this.createTransactionPinState,
    required this.withdrawFromWalletState,
  });

  factory WalletState.initial() {
    return WalletState(
      getWalletDetailsState: LoadState.loading,
      createTransactionPinState: LoadState.idle,
      withdrawFromWalletState: LoadState.idle,
    );
  }

  WalletState copyWith({
    LoadState? getWalletDetailsState,
    WalletDetailsModel? walletDetails,
    LoadState? createTransactionPinState,
    LoadState? withdrawFromWalletState,
  }) {
    return WalletState(
      getWalletDetailsState: getWalletDetailsState ?? this.getWalletDetailsState,
      walletDetails: walletDetails ?? this.walletDetails,
      createTransactionPinState: createTransactionPinState ?? this.createTransactionPinState,
      withdrawFromWalletState: withdrawFromWalletState ?? this.withdrawFromWalletState,
    );
  }
}