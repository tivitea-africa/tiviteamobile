import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:tivi_tea/core/const/base.dart';

final registerProvider =
    Provider<PartnerRegisterService>((ref) => PartnerRegisterService());
final _logger = Logger();

class PartnerRegisterService {
  Future<String> register(
    String firstName,
    String lastName,
    String email,
    String number,
    String password,
    String pswrdConfirm,
    String altNumber,
    String street,
    String city,
    String state,
    String country,
    String postalCode,
    String companyName,
    String businessDescription,
    String businessType,
  ) async {
    String message = 'Something went wrong';
    final url =
        Uri.parse('${BasePaths.baseProdUrl}authentication/partner/sign-up');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "phone_number": number,
            "password": password,
            "confirm_password": pswrdConfirm,
            "alternate_phone_number": altNumber,
            "company_name": companyName,
            "address": {
              "street": street,
              "city": city,
              "state": state,
              "country": country,
              "postal_code": postalCode,
            },
            "business_description": businessDescription,
            "business_type": businessType,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _logger.d(responseData);
        message = 'Registration succesful';

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
