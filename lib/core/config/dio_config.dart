import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/core/services/rest_client/app_interceptor.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class BaseEnv {
  static const String baseUrl = "https://api.tivitea.org";
}

ProviderFamily<Dio, String> _dio = Provider.family<Dio, String>((ref, baseUrl) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.headers = {
    'Content-Type': 'application/json',
    'accept': 'application/json',
  };
  dio.interceptors.add(
    DioInterceptor(
      dio: dio,
      userRepository: UserRepoImpl(
        //LocalStorageImpl(Hive.box(HiveKeys.appBox)),
        ref,
        RestClient(dio),
      ),
      //ref: ref,
    ),
  );
  return dio;
});

final restClient = Provider((ref) {
  const env = BaseEnv.baseUrl;
  return RestClient(ref.read(_dio.call(env)));
});
