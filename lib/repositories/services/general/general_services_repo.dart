import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/home/model/client/category_response_model.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';

///Repo contains method or network calls shared between client and service provider

final class GeneralServicesRepo {
  final RestClient restClient;

  GeneralServicesRepo({required this.restClient});

  Future<BaseResponse<GenericPaginatedResponse<CategoryResponseModel>>>
      getCategories() async {
    try {
      return await restClient.getCategories();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<GenericPaginatedResponse<ListingResponseModel>>>
      getListing() async {
    try {
      return await restClient.getListing();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
