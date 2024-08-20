// import 'dart:convert';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';
// import 'package:tivi_tea/core/const/base.dart';

// final verifyMailProvider =
//     Provider<VerifmailService>((ref) => VerifmailService());
// final _logger = Logger();

// class VerifmailService {
//   Future<String> verifyMail(
//     String email,
//   ) async {
//     String message = 'Something went wrong';
//     final url =
//         Uri.parse('${BasePaths.baseProdUrl}authentication/verify-email');

//     try {
//       final response = await http.patch(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           "email": email,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         _logger.d(responseData);
//         message = 'Email verifies successful';

//         _logger.f(responseData);

//         return message;
//       } else if (response.statusCode == 400) {
//         message = 'Email or password is incorrect';
//         final responseData = json.decode(response.body);
//         _logger.e(responseData);
//         return message;
//       } else if (response.statusCode == 500) {
//         message = 'Internal server error';
//         final responseData = json.decode(response.body);
//         _logger.e(responseData);
//         return message;
//       } else {
//         _logger.e(response.statusCode);
//         message = response.body;
//         return message;
//       }
//     } catch (e) {
//       _logger.e(e);
//       return 'No Internet Connection';
//     }
//   }
// }
