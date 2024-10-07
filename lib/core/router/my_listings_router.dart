import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view/pages/create_new_listing_second_view.dart';
import 'package:tivi_tea/features/services/view/pages/create_new_listing_view.dart';

class MyListingsRouter {
  static final createListingView = GoRoute(
    path: AppRoutes.createListingView,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateNewListingView();
    },
  );
  static final createListingSecondView = GoRoute(
    path: AppRoutes.createListingSecondView,
    builder: (BuildContext context, GoRouterState state) {
      final params = state.extra as List<dynamic>;
      final listingType = params[0] as CreateListingType;
      final categoryId = params[1] as String;
      return CreateNewListingSecondView(
        listingType: listingType,
        categoryId: categoryId,
      );
    },
  );
}
