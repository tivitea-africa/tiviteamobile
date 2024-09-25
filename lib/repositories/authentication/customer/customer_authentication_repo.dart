import 'package:dio/dio.dart';
import 'package:tivi_tea/core/config/exceptions/app_exception.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/services/rest_client/rest_client.dart';
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
}
