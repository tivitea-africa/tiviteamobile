import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tivi_tea/core/const/base.dart';

final loginProvider = Provider<LoginService>((ref) => LoginService());
final _logger = Logger();

class LoginService {
  Future<String> login(
    String email,
    String password,
  ) async {
    String message = 'Something went wrong';
    final url = Uri.parse('${BasePaths.baseProdUrl}authentication/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _logger.d(responseData);

        final result = responseData['data'] ?? '';
        final devices = result['user']['devices'] ?? [];
        final firstName = result['user']['firstname'] ?? '';
        final token = result['token'] ?? '';
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('firstname', firstName);
        prefs.setString('token', token);
        _logger.f(firstName);

        // Retrieve FCM token from SharedPreferences
        final storedFcmToken = prefs.getString('fcm_token');

        if (storedFcmToken != null && devices.isNotEmpty) {
          // Check if the FCM token exists in the devices list
          final tokenExists = devices.any((device) {
            return device['token'] == storedFcmToken;
          });

          if (tokenExists) {
            message = 'Login Successful';
            _logger.i('FCM token exists in the API response.');
            return message;
          } else {
            message = "Token doesn't exist";
            _logger.w('FCM token does not exist in the API response.');
            return message;
          }
        } else {
          message = "Token doesn't exist";
          _logger.w('No FCM token found or devices list is empty.');
          return message;
        }
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
