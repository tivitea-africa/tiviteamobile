import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/home/view/client/all_listing_view.dart';

class HomeRouter {
  static final allListingsView = GoRoute(
    path: AppRoutes.allListingsView,
    builder: (BuildContext context, GoRouterState state) {
      return const AllListingsView();
    },
  );
}
