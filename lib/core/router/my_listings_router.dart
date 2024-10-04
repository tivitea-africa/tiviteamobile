import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/services/view/pages/create_new_listing_view.dart';

class MyListingsRouter {
  static final serviceProviderDashboard = GoRoute(
    path: AppRoutes.createListingView,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateNewListingView();
    },
  );
}
