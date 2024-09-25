import 'dart:async';

import 'package:dio/dio.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  final UserRepository userRepository;
  DioInterceptor({required this.dio, required this.userRepository});

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final String token = userRepository.getToken();
      // if (token.isNotEmpty) {
      //   options.headers['Authorization'] = 'Bearer $token';
      //   debugLog('[TOKEN]$token');
      // }
    } catch (e) {
      debugLog(e);
    }

    debugLog('[URL]${options.uri}');
    debugLog('[BODY] ${options.data}');
    debugLog('[METHOD] ${options.method} => PATH: ${options.path}');
    debugLog('[QUERIES]${options.queryParameters}');

    handler.next(options);
    return options;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    debugLog(
      '[RESPONSE FROM ${response.requestOptions.path}]: ${response.data}',
    );

    handler.next(response);
    return response;
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response != null && err.response!.statusCode == 401) {
      //TODO: Refresh token
      return;
    }
    debugLog('[ERROR] ${err.requestOptions.uri}');
    debugLog('[ERROR] ${err.response}');
    handler.next(err);
    return err;
  }

  Future<void> handleError(
    ErrorInterceptorHandler handler,
    DioException err,
    Dio dio,
  ) async {
    final opts = Options(
      method: err.requestOptions.method,
      headers: err.requestOptions.headers,
    );
    final cloneReq = await dio.request<Map<String, dynamic>?>(
      err.requestOptions.path,
      options: opts,
      data: err.requestOptions.data,
      queryParameters: err.requestOptions.queryParameters,
    );

    return handler.resolve(cloneReq);
  }

  void _refreshToken(String? token) {}
}
