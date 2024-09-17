import 'package:dio/dio.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/utils/logger.dart';

class AppException {
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response == null ||
          DioExceptionType.badResponse != e.type &&
              e.response!.statusCode! >= 500) {
        return BaseResponse(
          status: e.response?.data["status"] ?? "SERVER_ERROR",
          message: "A server error occurred",
          data: data,
        );
      }

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response?.data["error"];

        // Check if error field exists in the response
        if (errorData is Map<String, dynamic>) {
          debugLog(errorData);
          return BaseResponse(
            status: e.response?.data["status"] ?? "",
            data: data,
            message: errorData["message"] ?? "Unknown error",
            error: errorData["reason"] ?? "",
          );
        }

        debugLog(e.response?.data);
        return BaseResponse(
          status: e.response?.data["status"] ?? "",
          data: data,
          message: e.response?.data["message"] ?? "An error occurred",
        );
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return BaseResponse(
          status: "",
          message: e.response?.data,
          data: data,
        );
      }
    }
    return BaseResponse(
      status: "",
      data: data,
      message: _mapException(e.type),
    );
  }

  static _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return "Your connection timed out";
    } else if (DioExceptionType.connectionError == error) {
      return "Please check your internet connection";
    }
    return "An error occurred";
  }
}
