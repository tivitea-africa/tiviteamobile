import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/kyc/model/client_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/model/partner_kyc_request_body.dart';
import 'package:tivi_tea/features/login/model/general/delete_account_request_body.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/model/general/login_response_object.dart';
import 'package:tivi_tea/features/profile/model/change_password_model.dart';
import 'package:tivi_tea/features/registration/model/client/social_auth_model.dart';
import 'package:tivi_tea/features/registration/model/client/social_auth_response.dart';
import 'package:tivi_tea/models/user_model.dart';
import 'package:tivi_tea/repositories/enums.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';

final class GeneralAuthenticationRepo {
  final RestClient restClient;
  final UserRepository? userRepository;

  GeneralAuthenticationRepo({
    required this.restClient,
    this.userRepository,
  });

  Future<BaseResponse<SocialAuthResponse>> signUpWithSocialAuth(
    SocialAuthModel data,
  ) async {
    try {
      final result = await restClient.signUpWithSocialAuth(data);
      final userLoginData = result.data;
      userRepository?.saveToken(userLoginData?.tokens?.access ?? '');
      userRepository?.saveRefreshToken(userLoginData?.tokens?.refresh ?? '');

      userRepository?.saveUser(userLoginData?.user);

      final user = userRepository?.getUser();
      userRepository?.saveUser(
        user?.copyWith(kycIsVerified: userLoginData?.kycIsVerified),
      );

      if (userLoginData?.kycIsVerified == true) {
        final user = userRepository?.getUser();
        userRepository?.saveUser(
          user?.copyWith(
            kycVerificationStatus: KYCVerificationStatus.documentsVerified,
          ),
        );
      }

      return result;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<LoginResponseObject>> login(
    LoginRequestObject data, {
    required void Function(User?) saveUserState,
  }) async {
    try {
      await userRepository?.clearUserSession();
      final result = await restClient.login(data);
      final userLoginData = result.data;

      userRepository?.saveToken(userLoginData?.tokens?.access ?? '');
      userRepository?.saveRefreshToken(userLoginData?.tokens?.refresh ?? '');

      final updatedUser = userLoginData?.user?.copyWith(
        kycIsVerified: userLoginData.kycIsVerified,
        kycVerificationStatus: userLoginData.kycIsVerified == true
            ? KYCVerificationStatus.documentsVerified
            : null,
      );

      userRepository?.saveUser(updatedUser);

      saveUserState(updatedUser);

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

  Future<BaseResponse> changePassword(ChangePasswordModel data) async {
    try {
      return await restClient.changePassword(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> submitKyc(PartnerKycRequestBody data) async {
    try {
      final result = await restClient.submitKyc(data);
      final user = userRepository?.getUser();
      await userRepository?.saveUser(
        user?.copyWith(
          kycVerificationStatus: KYCVerificationStatus.documentsSubmitted,
        ),
      );

      return result;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> deleteAccount() async {
    try {
      final refreshToken = userRepository?.getRefreshToken() ?? '';
      final requestBody = DeleteAccountRequestBody(refresh: refreshToken);
      final result = await restClient.deleteAccount(requestBody);
      // Clear all local data after successful deletion
      await userRepository?.clearLocalUserInfo();
      return result;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse> submitClientKyc(ClientKYCRequestBody data) async {
    try {
      final result = await restClient.submitClientKyc(data);
      final user = userRepository?.getUser();
      final userWithUpdatedKYCVerificationStatus = user?.copyWith(
        kycVerificationStatus: KYCVerificationStatus.documentsSubmitted,
      );
      await userRepository?.saveUser(userWithUpdatedKYCVerificationStatus);

      return result;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  void logout({required VoidCallback onDataCleared}) async {
    try {
      await userRepository?.clearUserSession();
      onDataCleared();
    } catch (e) {
      debugLog(e.toString());
    }
  }
}
