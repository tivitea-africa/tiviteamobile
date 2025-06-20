import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/payment/model/wallet_details_model.dart';

final class WalletRepo {
  final RestClient restClient;

  WalletRepo({
    required this.restClient,
  });

  Future<BaseResponse<WalletDetailsModel>> getWalletDetails() async {
    try {
      return await restClient.getWalletDetails();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> createTransactionPin(UpdatePinModel data) async {
    try {
      return await restClient.createTransactionPin(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> withdrawFromWallet(WithdrawFromWalletModel data) async {
    try {
      return await restClient.withdrawFromWallet(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}