import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/features/registration/domain/service_provider_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/domain/service_provider_sign_up_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //<====================> Authentication <====================>
  @POST('/authentication/partner/sign-up')
  Future<BaseResponse<ServiceProviderSignUpResponse>> signUpAsServiceProvider(
    ServiceProviderSignUpRequestBody data
  );
}