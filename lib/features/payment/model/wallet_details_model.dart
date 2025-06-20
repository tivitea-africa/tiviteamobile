import 'package:json_annotation/json_annotation.dart';

part 'wallet_details_model.g.dart';

@JsonSerializable()
class WalletDetailsModel {
  @JsonKey(name: 'available_balance')
  final double availableBalance;

  @JsonKey(name: 'book_balance') 
  final double bookBalance;

  final String currency;

  @JsonKey(name: 'has_trans_pin')
  final bool hasTransPin;

  const WalletDetailsModel({
    required this.availableBalance,
    required this.bookBalance, 
    required this.currency,
    required this.hasTransPin,
  });

  factory WalletDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WalletDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDetailsModelToJson(this);
}

@JsonSerializable()
class UpdatePinModel {
  @JsonKey(name: 'old_pin')
  final String oldPin;

  final String pin;

  @JsonKey(name: 'confirm_pin')
  final String confirmPin;

  const UpdatePinModel({
    required this.oldPin,
    required this.pin,
    required this.confirmPin,
  });

  factory UpdatePinModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatePinModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePinModelToJson(this);
}

@JsonSerializable()
class WithdrawFromWalletModel {
  final String amount;
  final String pin;

  const WithdrawFromWalletModel({
    required this.amount,
    required this.pin,
  });

  factory WithdrawFromWalletModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawFromWalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawFromWalletModelToJson(this);
}
