import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/config/dio_config.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class NetworkService {
  final Dio _dio;

  Dio get dio => _dio;

  NetworkService(this._dio);

  Future<Response<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
}

ProviderFamily<Dio, String> _dio = Provider.family<Dio, String>((ref, baseUrl) {
  final userRepository = ref.read(userRepositoryProvider);
  final String token = userRepository.getToken();
  final dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.headers = {
    'Content-Type': 'application/json',
    'accept': 'application/json',
  };
  if (token.isNotEmpty) {
    dio.options.headers['Authorization'] = 'JWT $token';
  }
  dio.options.receiveTimeout = const Duration(seconds: 15);
  dio.options.connectTimeout = const Duration(seconds: 15);
  dio.options.sendTimeout = const Duration(seconds: 10);
  return dio;
});

final networkServiceProvider = Provider((ref) {
  return NetworkService(
    ref.read(_dio.call(BaseEnv.baseUrl)),
  );
});
