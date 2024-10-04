import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/home/model/service_provider/service_provider_dashboard_model.dart';

final class ServiceProviderDashBoardRepo {
  final RestClient restClient;

  ServiceProviderDashBoardRepo({required this.restClient});

  Future<BaseResponse<ServiceProviderDashboardModel>>
      getServiceProviderDashboard() async {
    try {
      return await restClient.getServiceProviderDashboard();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
