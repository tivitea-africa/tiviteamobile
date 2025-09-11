import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/registration/model/client/social_auth_model.dart';
import 'package:tivi_tea/core/services/local_storage/local_storage.dart';
import 'package:tivi_tea/core/services/local_storage/storage_keys.dart';

final class ThirdPartyAuthRepo {
  final GoogleSignIn googleSignIn;
  final LocalStorage localStorage;
  ThirdPartyAuthRepo({required this.googleSignIn, required this.localStorage,});

  Future<BaseResponse<SocialAuthModel>> signIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      try {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final user = userCredential.user;
        return BaseResponse(
          status: 'success',
          data: SocialAuthModel(
            email: user?.email,
            firstName: user?.displayName,
            lastName: user?.displayName,
            authId: user?.uid,
            authProvider: 'google',
            profilePicture: user?.photoURL ?? '',
            phoneNumber: user?.phoneNumber ?? '',
          ),
        );
      } on FirebaseAuthException catch (e) {
        return BaseResponse(status: 'error', message: e.message);
      }
    }
    return const BaseResponse(status: 'error', message: 'User not found');
  }

  Future<BaseResponse<SocialAuthModel>> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      final user = userCredential.user;

      // Extract name from Apple credential
      String? firstName;
      String? lastName;
      String? email;
      
      // Check if Apple provided name data (only available on first login)
      if (appleCredential.givenName != null || appleCredential.familyName != null) {
        firstName = appleCredential.givenName;
        lastName = appleCredential.familyName;
        email = appleCredential.email;
        
        // Store the user data locally for future logins
        if (firstName != null) {
          await localStorage.put(HiveKeys.appleFirstName, firstName);
        }
        if (lastName != null) {
          await localStorage.put(HiveKeys.appleLastName, lastName);
        }
        if (email != null) {
          await localStorage.put(HiveKeys.appleEmail, email);
        }
      } else {
        // Apple didn't provide name data (subsequent logins)
        // Try to get from Firebase user displayName first
        if (user?.displayName != null) {
          final nameParts = user!.displayName!.split(' ');
          firstName = nameParts.isNotEmpty ? nameParts.first : null;
          lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : null;
        } else {
          // Fallback to stored values from local storage
          firstName = localStorage.get<String>(HiveKeys.appleFirstName);
          lastName = localStorage.get<String>(HiveKeys.appleLastName);
        }
        
        // Get email from stored value if not available from Apple
        email = appleCredential.email ?? localStorage.get<String>(HiveKeys.appleEmail);
      }

      debugLog(email);
      debugLog(firstName);
      debugLog(lastName);

      return BaseResponse(
        status: 'success',
        data: SocialAuthModel(
          email: user?.email ?? email,
          firstName: firstName,
          lastName: lastName,
          authId: user?.uid,
          authProvider: 'apple',
          profilePicture: user?.photoURL ?? '',
          phoneNumber: user?.phoneNumber ?? '',
        ),
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      return BaseResponse(status: 'error', message: e.message);
    } on FirebaseAuthException catch (e) {
      return BaseResponse(status: 'error', message: e.message);
    } catch (e) {
      return BaseResponse(status: 'error', message: 'Apple Sign-In failed: $e');
    }
  }
}
