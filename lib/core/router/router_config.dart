import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/login/view/pages/forgot_password.dart';
import 'package:tivi_tea/features/login/view/pages/login_view.dart';
import 'package:tivi_tea/features/onboarding/view/pages/select_user_type_view.dart';
import 'package:tivi_tea/features/onboarding/view/pages/splash_screen.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/view/pages/create_customer_account_view.dart';
import 'package:tivi_tea/features/registration/view/pages/create_service_provider_account_second_view.dart';
import 'package:tivi_tea/features/registration/view/pages/create_service_provider_account_view.dart';
import 'package:tivi_tea/screens/bottomNav/navbar.dart';
import 'package:tivi_tea/features/onboarding/view/pages/onboarding_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.onboardingView,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingView();
      },
    ),
    GoRoute(
      path: AppRoutes.selectUserTypeView,
      builder: (BuildContext context, GoRouterState state) {
        return const SelectUserTypeView();
      },
    ),
    GoRoute(
      path: AppRoutes.loginView,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: AppRoutes.forgotPasswordView,
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotPasswordView();
      },
    ),
    GoRoute(
      path: AppRoutes.createCustomerAccount,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateCustomerAccount();
      },
    ),
    GoRoute(
      path: AppRoutes.createServiceProviderAccount,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateServiceProviderAccount();
      },
    ),
    GoRoute(
      path: AppRoutes.createServiceProviderAccountSecondView,
      builder: (BuildContext context, GoRouterState state) {
        final data = state.extra as ServiceProviderSignUpRequestBody;
        return CreateServiceProviderAccountSecondView(data: data);
      },
    ),
    GoRoute(
      path: '/bottomNav',
      builder: (BuildContext context, GoRouterState state) {
        return const NaviBar();
      },
    ),
  ],
);
