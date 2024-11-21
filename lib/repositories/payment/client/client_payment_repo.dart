import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/payment/model/create_payment_response.dart';

final class ClientPaymentRepo {
  final RestClient restClient;
  ClientPaymentRepo({required this.restClient});

  Future<BaseResponse<CreatePaymentResponse>> createPayment({
    required String bookingId,
  }) async {
    try {
      return await restClient.createPayment(bookingId: bookingId);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
