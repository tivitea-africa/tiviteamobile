import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/core/services/rest_client/custom_rest_client_class.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
import 'package:tivi_tea/features/services/model/book_work_tool_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_response.dart';

final class BookingRepo {
  final RestClient restClient;
  final NetworkService customNetworkService;

  BookingRepo({
    required this.restClient,
    required this.customNetworkService,
  });

  Future<BaseResponse<BookWorkSpaceResponse>> bookWorkspace(
    String listingId,
    BookWorkSpaceModel data,
  ) async {
    try {
      return await restClient.bookWorkspace(listingId, data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<BookWorkSpaceResponse>> bookWorktool(
    String listingId,
    BookWorkToolModel data,
  ) async {
    try {
      return await restClient.bookWorktool(listingId, data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<GenericPaginatedResponse<BookingHistoryModel>>>
      getBookingHistory({required int page}) async {
    try {
      return await restClient.getBookingHistory(page);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<File>> generateBookingTicket(String bookingId) async {
    try {
      debugLog('Generating booking ticket for: $bookingId');
      final response = await customNetworkService.get<List<int>>(
        '/bookings/ticket-pdf/$bookingId',
        options: Options(responseType: ResponseType.bytes),
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

      if (response.data is List<int>) {
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

        final String fileName = '${bookingId.split('-').last}.pdf';
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
      } else {
        return const BaseResponse(
          status: 'Failure',
          data: null,
          message: 'Failed to get PDF data',
        );
      }
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> checkInCheckOut(String bookingId) async {
    try {
      return await restClient.checkInCheckOut(bookingId: bookingId);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
