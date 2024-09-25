import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/features/home/model/client/category_response_model.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/model/general/login_response_object.dart';
import 'package:tivi_tea/features/registration/model/client/customer_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //<====================> Authentication <====================>
  @POST('/authentication/partner/sign-up')
  Future<BaseResponse<ServiceProviderSignUpResponse>> signUpAsServiceProvider(
    @Body() ServiceProviderSignUpRequestBody data,
  );
  @POST('/authentication/client/sign-up')
  Future<BaseResponse<CustomerSignUpResponseBody>> signUpAsCustomer(
    @Body() CustomerSignUpRequestBody data,
  );
  @POST('/authentication/login')
  Future<BaseResponse<LoginResponseObject>> login(
    @Body() LoginRequestObject data,
  );
  @POST('/authentication/reset-password')
  Future<BaseResponse> forgotPassword(@Body() ForgotPasswordRequestObject data);

  //<====================> Service <====================>
  @GET('/listings/')
  Future<BaseResponse<GenericPaginatedResponse<ListingResponseModel>>>
      getListing();
  @GET('/listings/categories')
  Future<BaseResponse<GenericPaginatedResponse<CategoryResponseModel>>>
      getCategories();
}
