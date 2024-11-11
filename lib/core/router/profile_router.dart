import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/profile/view/change_password_view.dart';
import 'package:tivi_tea/features/profile/view/edit_profile_view.dart';

class ProfileRouter {
  static final editProfile = GoRoute(
    path: AppRoutes.editProfileView,
    builder: (BuildContext context, GoRouterState state) {
      return const EditProfileView();
    },
  );
  static final changePassword = GoRoute(
    path: AppRoutes.changePasswordView,
    builder: (BuildContext context, GoRouterState state) {
      return const ChangePasswordView();
    },
  );
}
