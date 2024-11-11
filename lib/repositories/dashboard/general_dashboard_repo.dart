import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/profile/model/edit_profile_model.dart';
import 'package:tivi_tea/models/user_model.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';

final class GeneralDashboardRepo {
  final RestClient restClient;
  final UserRepository userRepository;

  GeneralDashboardRepo({
    required this.restClient,
    required this.userRepository,
  });

  Future<BaseResponse<GetUserProfileResponse>> getUserProfile() async {
    try {
      final result = await restClient.getUserProfile();
      final userLoginData = result.data?.user;

      userRepository.saveUser(userLoginData);

      //This was done this way for a reason at the time, and can't remember.
      //TODO: Revisit

      userRepository.saveUser(
        userLoginData?.copyWith(
          kycIsVerified: userLoginData.kycIsVerified,
        ),
      );
      return result;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<User>> updateUserProfile(EditProfileModel data) async {
    try {
      final result = await restClient.updateUserProfile(data);
      final userLoginData = result.data;

      userRepository.saveUser(userLoginData);

      return result;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}
