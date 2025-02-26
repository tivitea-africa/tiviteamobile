import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/home/view/general/all_listing_view.dart';
import 'package:tivi_tea/features/kyc/model/partner_kyc_request_body.dart';
import 'package:tivi_tea/features/kyc/view/pages/client/client_kyc_view.dart';
import 'package:tivi_tea/features/kyc/view/pages/partner/partner_kyc_first_view.dart';
import 'package:tivi_tea/features/kyc/view/pages/partner/partner_kyc_second_view.dart';
import 'package:tivi_tea/features/payment/view/payment_receipt_view.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view/pages/book_workspace_view.dart';
import 'package:tivi_tea/features/services/view/pages/booking_summary_view.dart';
import 'package:tivi_tea/features/services/view/pages/choose_room_view.dart';
import 'package:tivi_tea/features/services/view/pages/e_ticket_view.dart';
import 'package:tivi_tea/features/services/view/pages/listing_detail_view.dart';
import 'package:tivi_tea/features/services/view/pages/new_bookworkspace_view.dart';
import 'package:tivi_tea/features/services/view/pages/start_kyc_process_page.dart';

class ServicesRouter {
  static final listingDetails = GoRoute(
    path: AppRoutes.listingDetailsView,
    builder: (BuildContext context, GoRouterState state) {
      final listingId = state.extra as String;
      return ListingDetailView(listingId: listingId);
    },
  );
  static final bookWorkspaceView = GoRoute(
    path: AppRoutes.bookListingView,
    builder: (BuildContext context, GoRouterState state) {
      final data = state.extra as ListingResponseModel;
      if (data.listingType?.enumType == CreateListingType.workSpace) {
        return NewBookWorkspaceOrListingView(listing: data);
      } else {
        return BookWorkSpaceOrListingView(listing: data);
      }
    },
  );
  static final bookingSummaryView = GoRoute(
    path: AppRoutes.bookingSummaryView,
    builder: (BuildContext context, GoRouterState state) {
      final data = state.extra as BookingSummaryParams;
      return BookingSummaryView(params: data);
    },
  );
  static final partnerKYCFirstView = GoRoute(
    path: AppRoutes.partnerKYCFirstView,
    builder: (BuildContext context, GoRouterState state) {
      return const PartnerKYCFirstView();
    },
  );
  static final partnerKYCSecondView = GoRoute(
    path: AppRoutes.partnerKYCSecondView,
    builder: (BuildContext context, GoRouterState state) {
      final data = state.extra as KYCSecondViewParams;
      return PartnerKYCSecondView(params: data);
    },
  );
  static final startKYCProcessView = GoRoute(
    path: AppRoutes.startKYCProcessView,
    builder: (BuildContext context, GoRouterState state) {
      return const StartKYCProcessView();
    },
  );
  static final clientKYCView = GoRoute(
    path: AppRoutes.clientKYCView,
    builder: (BuildContext context, GoRouterState state) {
      return const ClientKYCView();
    },
  );
  static final chooseRoomView = GoRoute(
    path: AppRoutes.chooseRoomView,
    builder: (BuildContext context, GoRouterState state) {
      final params = state.extra as ChooseRoomViewParams;
      return ChooseRoomView(params: params);
    },
  );
  static final eReceiptView = GoRoute(
    path: AppRoutes.eReceiptView,
    builder: (BuildContext context, GoRouterState state) {
      final extras = state.extra as List<String>;
      final paymentId = extras[0];
      final bookingId = extras[1];
      return PaymentReceiptView(paymentId: paymentId, bookingId: bookingId);
    },
  );
  static final eTicketView = GoRoute(
    path: AppRoutes.eTicketView,
    builder: (BuildContext context, GoRouterState state) {
      final bookingId = state.extra as String;
      return ETicketView(bookingId: bookingId);
    },
  );
  static final allListingsView = GoRoute(
    path: AppRoutes.allListingsView,
    builder: (BuildContext context, GoRouterState state) {
      return const AllListingsView();
    },
  );
}
