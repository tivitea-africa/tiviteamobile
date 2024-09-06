import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:tivi_tea/screens/auth/reguster/options_register.dart';
import 'package:tivi_tea/screens/auth/signIn_screen.dart';
import 'package:tivi_tea/screens/bottomNav/navbar.dart';
import 'package:tivi_tea/screens/onboard/onboard_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardView();
      },
    ),
    GoRoute(
      path: '/optionToRegister',
      builder: (BuildContext context, GoRouterState state) {
        return const OptionsRegisterScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/roleOptions',
      builder: (BuildContext context, GoRouterState state) {
        return const OptionsRegisterScreen();
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
