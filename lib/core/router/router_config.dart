import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/onboarding/presentation/pages/select_user_type_view.dart';
import 'package:tivi_tea/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:tivi_tea/screens/auth/signIn_screen.dart';
import 'package:tivi_tea/screens/bottomNav/navbar.dart';
import 'package:tivi_tea/features/onboarding/presentation/pages/onboarding_view.dart';

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
        return const SignInScreen();
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
