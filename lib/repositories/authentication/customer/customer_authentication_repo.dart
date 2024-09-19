import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/model/general/login_response_object.dart';
import 'package:tivi_tea/features/registration/model/client/customer_sign_up_request_body.dart';
import 'package:tivi_tea/repositories/user/user_repo.dart';

final class CustomerAuthenticationRepo {
  final RestClient restClient;
  final UserRepository userRepository;

  CustomerAuthenticationRepo({
    required this.restClient,
    required this.userRepository,
  });

  Future<BaseResponse<CustomerSignUpResponseBody>> signUpAsCustomer(
    CustomerSignUpRequestBody data,
  ) async {
    try {
      return await restClient.signUpAsCustomer(data);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  Future<BaseResponse<LoginResponseObject>> loginAsCustomer(
    LoginRequestObject data,
  ) async {
    try {
      return await restClient.login(data);
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
}
