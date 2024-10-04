import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/home/view/client/all_listing_view.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';

class HomeRouter {
  static final serviceProviderDashboard = GoRoute(
    path: AppRoutes.serviceProviderDashboard,
    builder: (BuildContext context, GoRouterState state) {
      return const ServiceProviderDashboard();
    },
  );
  static final allListingsView = GoRoute(
    path: AppRoutes.allListingsView,
    builder: (BuildContext context, GoRouterState state) {
      return const AllListingsView();
    },
  );
}
