import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:tivi_tea/core/const/base.dart';

final kycProvider = Provider<KycService>((ref) => KycService());
final _logger = Logger();

class KycService {
  Future<String> kyc(
    String docType,
    String regNo,
    String docImg,
    String utilityBill,
    String utilityBillImg,
  ) async {
    String message = 'Something went wrong';
    final url = Uri.parse('${BasePaths.baseProdUrl}authentication/kyc');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "document_type": docType,
          "registration_number": regNo,
          "business_document_image": docImg,
          "utility_bill": utilityBill,
          "utility_bill_image": utilityBillImg,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _logger.d(responseData);
        message = 'Kyc Successful';

        _logger.f(responseData);

        return message;
      } else if (response.statusCode == 400) {
        message = 'Email or password is incorrect';
        final responseData = json.decode(response.body);
        _logger.e(responseData);
        return message;
      } else if (response.statusCode == 500) {
        message = 'Internal server error';
        final responseData = json.decode(response.body);
        _logger.e(responseData);
        return message;
      } else {
        _logger.e(response.statusCode);
        message = response.body;
        return message;
      }
    } catch (e) {
      _logger.e(e);
      return 'No Internet Connection';
    }
  }
}
