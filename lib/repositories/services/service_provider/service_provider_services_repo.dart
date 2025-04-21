import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/model/bank_model.dart';
import 'package:tivi_tea/features/services/model/create_foot_soldier_model.dart';
import 'package:tivi_tea/features/services/model/create_foot_soldier_response.dart';
import 'package:tivi_tea/features/services/model/create_transfer_recipient_model.dart';
import 'package:tivi_tea/features/services/model/create_transfer_recipient_response.dart';
import 'package:tivi_tea/features/services/model/get_account_details_request_body.dart';
import 'package:tivi_tea/features/services/model/get_account_details_response.dart';
import 'package:tivi_tea/features/services/model/post_listing_model.dart';
import 'package:tivi_tea/features/services/model/post_worktool_model.dart';

final class ServiceProviderServicesRepo {
  final RestClient restClient;

  ServiceProviderServicesRepo({required this.restClient});

  Future<BaseResponse<GenericPaginatedResponse<ListingResponseModel>>>
      getPartnerListing(int page) async {
    try {
      return await restClient.getPartnerListing(page);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<ListingResponseModel>> postWorkSpace(
      PostListingModel model) async {
    try {
      return await restClient.postWorkSpace(model);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> postToolOrOtherListing(WorkToolListing model) async {
    try {
      return await restClient.postToolOrOtherListing(model);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<ListingResponseModel>> editWorkSpace(
    String listingId,
    PostListingModel model,
  ) async {
    try {
      return await restClient.editWorkSpace(listingId, model);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<ListingResponseModel>> editWorkTool(
    String listingId,
    WorkToolListing model,
  ) async {
    try {
      return await restClient.editWorkTool(listingId, model);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> deleteListing(String listingId) async {
    try {
      return await restClient.deleteListing(listingId);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<ListBanksResponse>> getBanks() async {
    try {
      return await restClient.getBanks();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<CreateTransferRecipientResponse>> createTransferRecipient(
    CreateTransferRecipientModel model,
  ) async {
    try {
      return await restClient.createTransferRecipient(model);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<GetAccountDetailsResponse>> getAccountDetails(
    GetAccountDetailsRequestBody data,
  ) async {
    try {
      return await restClient.getAccountDetails(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<CreateFootSoldierResponse>> createFootSoldier(
    CreateFootSoldierModel model,
  ) async {
    try {
      return await restClient.createFootSoldier(model);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
