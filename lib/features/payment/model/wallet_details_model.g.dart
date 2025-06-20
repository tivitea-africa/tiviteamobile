// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletDetailsModel _$WalletDetailsModelFromJson(Map<String, dynamic> json) =>
    WalletDetailsModel(
      availableBalance: (json['available_balance'] as num).toDouble(),
      bookBalance: (json['book_balance'] as num).toDouble(),
      currency: json['currency'] as String,
      hasTransPin: json['has_trans_pin'] as bool,
    );

Map<String, dynamic> _$WalletDetailsModelToJson(WalletDetailsModel instance) =>
    <String, dynamic>{
      'available_balance': instance.availableBalance,
      'book_balance': instance.bookBalance,
      'currency': instance.currency,
      'has_trans_pin': instance.hasTransPin,
    };

UpdatePinModel _$UpdatePinModelFromJson(Map<String, dynamic> json) =>
    UpdatePinModel(
      oldPin: json['old_pin'] as String,
      pin: json['pin'] as String,
      confirmPin: json['confirm_pin'] as String,
    );

Map<String, dynamic> _$UpdatePinModelToJson(UpdatePinModel instance) =>
    <String, dynamic>{
      'old_pin': instance.oldPin,
      'pin': instance.pin,
      'confirm_pin': instance.confirmPin,
    };

WithdrawFromWalletModel _$WithdrawFromWalletModelFromJson(
        Map<String, dynamic> json) =>
    WithdrawFromWalletModel(
      amount: json['amount'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$WithdrawFromWalletModelToJson(
        WithdrawFromWalletModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'pin': instance.pin,
    };
