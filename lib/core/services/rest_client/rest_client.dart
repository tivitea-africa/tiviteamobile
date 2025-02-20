import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/response/generic_paginated_response.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_model.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_request_body.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
import 'package:tivi_tea/features/home/model/client/category_response_model.dart';
import 'package:tivi_tea/features/home/model/client/client_dashboard_model.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/home/model/service_provider/service_provider_dashboard_model.dart';
import 'package:tivi_tea/features/kyc/model/client_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/model/partner_kyc_request_body.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/model/general/login_response_object.dart';
import 'package:tivi_tea/features/payment/model/create_payment_response.dart';
import 'package:tivi_tea/features/profile/model/change_password_model.dart';
import 'package:tivi_tea/features/profile/model/edit_profile_model.dart';
import 'package:tivi_tea/features/registration/model/client/customer_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_response.dart';
import 'package:tivi_tea/features/services/model/book_work_tool_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_response.dart';
import 'package:tivi_tea/features/services/model/post_listing_model.dart';
import 'package:tivi_tea/features/services/model/post_worktool_model.dart';
import 'package:tivi_tea/models/user_model.dart';

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
  @PUT('/authentication/change-password')
  Future<BaseResponse> changePassword(@Body() ChangePasswordModel data);
  @POST('/authentication/partner/submit-kyc')
  Future<BaseResponse> submitKyc(@Body() PartnerKycRequestBody data);
  @POST('/authentication/client/submit-kyc')
  Future<BaseResponse> submitClientKyc(@Body() ClientKYCRequestBody data);

  //<====================> Service <====================>
  @GET('/listings/')
  Future<BaseResponse<GenericPaginatedResponse<ListingResponseModel>>>
      getListing();

  @POST('/listings/')
  Future<BaseResponse<ListingResponseModel>> postWorkSpace(
      @Body() PostListingModel data);
  @GET('/listings/{listingId}')
  Future<BaseResponse<ListingResponseModel>> getListingId(
    @Path('listingId') String listingId,
  );

  ///This is the same endpoint as [postWorkSpace] above.
  ///However we'll call them separetly in case the endpoints are different in the future.
  @POST('/listings/')
  Future<BaseResponse> postToolOrOtherListing(@Body() WorkToolListing data);

  @GET('/listings/partner/listings')
  Future<BaseResponse<GenericPaginatedResponse<ListingResponseModel>>>
      getPartnerListing();
  @GET('/listings/categories')
  Future<BaseResponse<GenericPaginatedResponse<CategoryResponseModel>>>
      getCategories();

  //<====================> Bookings <====================>
  @POST('/bookings/client/{listingId}')
  Future<BaseResponse<BookWorkSpaceResponse>> bookWorkspace(
    @Path() String listingId,
    @Body() BookWorkSpaceModel data,
  );

  @POST('/bookings/client/{listingId}')
  Future<BaseResponse<BookWorkSpaceResponse>> bookWorktool(
    @Path() String listingId,
    @Body() BookWorkToolModel data,
  );

  @GET('/bookings/list')
  Future<BaseResponse<GenericPaginatedResponse<BookingHistoryModel>>>
      getBookingHistory(@Query('page') int page);

  //<====================> Dashboard <====================>
  @GET('/dashboard/partner')
  Future<BaseResponse<ServiceProviderDashboardModel>>
      getServiceProviderDashboard();
  @GET('/dashboard/client')
  Future<BaseResponse<ClientDashboardModel>> getClientDashboard();
  @GET('/dashboard/user/profile')
  Future<BaseResponse<GetUserProfileResponse>> getUserProfile();
  @POST('/dashboard/edit-profile')
  Future<BaseResponse<User>> updateUserProfile(@Body() EditProfileModel data);
  @POST('/dashboard/client/listing/favorite')
  Future<BaseResponse> favoriteListing(@Body() FavoriteListingRequestBody data);
  @GET('/dashboard/client/listing/favorite')
  Future<BaseResponse<GenericPaginatedResponse<FavoriteListingModel>>>
      getFavoriteListings(@Query('page') int page);

  //<====================> Miscellaneous <====================>
  @MultiPart()
  @POST('/misc/upload/')
  Future<UploadProfilePicResponse> uploadProfilePic({
    @Part() required File image,
  });

  //<====================> Payment <====================>
  @POST('/payment/{bookingId}')
  Future<BaseResponse<CreatePaymentResponse>> createPayment({
    @Path('bookingId') required String bookingId,
  });
  @GET('/bookings/')
  Future<BaseResponse<PaymentCallbackResponse>> getPaymentStatus({
    @Query('payment_id') required String paymentId,
  });
}
