import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/view/pages/book_workspace_view.dart';
import 'package:tivi_tea/features/services/view/pages/booking_summary_view.dart';
import 'package:tivi_tea/features/services/view/pages/listing_detail_view.dart';

class ServicesRouter {
  static final listingDetails = GoRoute(
    path: AppRoutes.listingDetailsView,
    builder: (BuildContext context, GoRouterState state) {
      final data = state.extra as ListingResponseModel;
      return ListingDetailView(listing: data);
    },
  );
  static final bookWorkspaceView = GoRoute(
    path: AppRoutes.bookListingView,
    builder: (BuildContext context, GoRouterState state) {
      final data = state.extra as ListingResponseModel;
      return BookWorkSpaceOrListingView(listing: data);
    },
  );
  static final bookingSummaryView = GoRoute(
    path: AppRoutes.bookingSummaryView,
    builder: (BuildContext context, GoRouterState state) {
      final data = state.extra as ListingResponseModel;
      return BookingSummaryView(listing: data);
    },
  );
}
