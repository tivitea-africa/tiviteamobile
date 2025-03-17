import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tivi_tea/core/response/base_response.dart';
import 'package:tivi_tea/features/registration/model/client/social_auth_model.dart';

final class ThirdPartyAuthRepo {
  final GoogleSignIn googleSignIn;

  ThirdPartyAuthRepo({required this.googleSignIn});

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
            profilePicture: user?.photoURL,
            phoneNumber: user?.phoneNumber ?? '',
          ),
        );
      } on FirebaseAuthException catch (e) {
        return BaseResponse(status: 'error', message: e.message);
      }
    }
    return const BaseResponse(status: 'error', message: 'User not found');
  }
}
