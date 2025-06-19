import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/custom_rest_client_class.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/payment/model/create_payment_response.dart';

final class ClientPaymentRepo {
  final RestClient restClient;
  final NetworkService customNetworkService;
  ClientPaymentRepo({
    required this.restClient,
    required this.customNetworkService,
  });

  Future<BaseResponse<CreatePaymentResponse>> createPayment({
    required String bookingId,
  }) async {
    try {
      return await restClient.createPayment(bookingId: bookingId);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<PaymentCallbackResponse>> getPaymentStatus({
    required String paymentId,
  }) async {
    try {
      return await restClient.getPaymentStatus(paymentId: paymentId);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<File>> generatePaymentReceipt(
    String paymentId,
  ) async {
    try {
      debugLog('Generating payment receipt for: $paymentId');
      final response = await customNetworkService.get<List<int>>(
        '/payment/receipt-pdf/$paymentId',
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      debugLog('Response status: ${response.statusCode}');
      debugLog('Response data type: ${response.data.runtimeType}');
      debugLog('Response data length: ${response.data?.length}');

      if (response.data == null) {
        return const BaseResponse(
          status: 'Failure',
          data: null,
          message: 'Failed to get PDF data',
        );
      }

      final Directory? appDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      if (appDir == null) {
        debugLog('PDF Save error');
        return const BaseResponse(
          status: 'Failure',
          data: null,
          message: 'Unable to access storage',
        );
      }

      final String fileName = '${paymentId.split('-').last}.pdf';
      final File file = File('${appDir.path}/$fileName');

      if (!await file.exists()) {
        await file.create();
      }
      await file.writeAsBytes(response.data!);

      debugLog('PDF saved successfully to: ${file.path}');

      return BaseResponse(
        status: 'Success',
        data: file,
        message: 'Receipt successfully generated',
      );
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
