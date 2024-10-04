import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';

final class ServiceProviderServicesRepo {
  final RestClient restClient;

  ServiceProviderServicesRepo({required this.restClient});

  Future<BaseResponse<GenericPaginatedResponse<ListingResponseModel>>>
      getPartnerListing() async {
    try {
      return await restClient.getPartnerListing();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
