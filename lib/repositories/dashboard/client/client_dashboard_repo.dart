import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_model.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_request_body.dart';
import 'package:tivi_tea/features/home/model/client/client_dashboard_model.dart';

final class ClientDashBoardRepo {
  final RestClient restClient;

  ClientDashBoardRepo({required this.restClient});

  Future<BaseResponse<ClientDashboardModel>>
      getServiceProviderDashboard() async {
    try {
      return await restClient.getClientDashboard();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> favoriteListing(FavoriteListingRequestBody data) async {
    try {
      return await restClient.favoriteListing(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<GenericPaginatedResponse<FavoriteListingModel>>>
      getFavoriteListings({int page = 0}) async {
    try {
      return await restClient.getFavoriteListings(page);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
