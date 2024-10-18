import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/router/home_router.dart';
import 'package:tivi_tea/core/router/my_listings_router.dart';
import 'package:tivi_tea/core/router/services_router.dart';
import 'package:tivi_tea/features/common/app_navbar.dart';
import 'package:tivi_tea/features/home/view/general_widget.dart';
import 'package:tivi_tea/features/login/view/pages/forgot_password.dart';
import 'package:tivi_tea/features/login/view/pages/login_view.dart';
import 'package:tivi_tea/features/onboarding/view/pages/select_user_type_view.dart';
import 'package:tivi_tea/features/onboarding/view/pages/splash_screen.dart';
import 'package:tivi_tea/features/profile/view/profile_view.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/view/pages/create_customer_account_view.dart';
import 'package:tivi_tea/features/registration/view/pages/create_service_provider_account_second_view.dart';
import 'package:tivi_tea/features/registration/view/pages/create_service_provider_account_view.dart';
import 'package:tivi_tea/features/onboarding/view/pages/onboarding_view.dart';
import 'package:tivi_tea/features/services/view/pages/my_listing_view.dart';
import 'package:tivi_tea/screens/services_section/service_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(
  debugLabel: 'home',
);
final _shellNavigatorServicesKey = GlobalKey<NavigatorState>(
  debugLabel: 'services',
);
final _shellNavigatorHistoryKey = GlobalKey<NavigatorState>(
  debugLabel: 'history',
);
final _shellNavigatoProfileKey = GlobalKey<NavigatorState>(
  debugLabel: 'profile',
);

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Navbar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          initialLocation: AppRoutes.homeView,
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: AppRoutes.homeView,
              name: AppRoutes.homeView,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: GeneralHomeScreeen(),
                );
              },
              routes: [
                HomeRouter.serviceProviderDashboard,
                HomeRouter.allListingsView,
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorServicesKey,
          routes: [
            GoRoute(
              path: AppRoutes.servicesView,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ServiceScreen(),
              ),
              routes: [
                ServicesRouter.listingDetails,
                ServicesRouter.bookWorkspaceView,
                ServicesRouter.bookingSummaryView,
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHistoryKey,
          routes: [
            GoRoute(
              path: AppRoutes.myListingView,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MyListingView(),
              ),
              routes: [
                MyListingsRouter.createListingView,
                MyListingsRouter.createListingSecondView,
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatoProfileKey,
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileView(),
              ),
            ),
          ],
        ),
      ],
    ),
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
    // GoRoute(
    //   path: AppRoutes.homeView,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const NaviBar();
    //   },
    // ),
  ],
);
