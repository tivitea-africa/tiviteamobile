import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/kyc/model/client_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/model/partner_kyc_request_body.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/model/general/login_response_object.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';

final class GeneralAuthenticationRepo {
  final RestClient restClient;
  final UserRepository? userRepository;

  GeneralAuthenticationRepo({
    required this.restClient,
    this.userRepository,
  });

  Future<BaseResponse<LoginResponseObject>> login(
    LoginRequestObject data,
  ) async {
    try {
      final result = await restClient.login(data);
      final userLoginData = result.data;
      userRepository?.saveToken(userLoginData?.tokens?.access ?? '');
      userRepository?.saveRefreshToken(userLoginData?.tokens?.refresh ?? '');

      userRepository?.saveUser(userLoginData?.user);
      userRepository?.saveUser(
        userLoginData?.user?.copyWith(
          kycIsVerified: userLoginData.kycIsVerified,
        ),
      );

      return result;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> forgotPassword(ForgotPasswordRequestObject data) async {
    try {
      return await restClient.forgotPassword(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> submitKyc(PartnerKycRequestBody data) async {
    try {
      return await restClient.submitKyc(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> submitClientKyc(ClientKYCRequestBody data) async {
    try {
      return await restClient.submitClientKyc(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
