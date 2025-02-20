import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
import 'package:tivi_tea/features/services/model/book_work_tool_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_response.dart';

final class BookingRepo {
  final RestClient restClient;

  BookingRepo({required this.restClient});

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
}
