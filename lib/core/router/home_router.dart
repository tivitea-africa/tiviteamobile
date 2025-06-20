import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
import 'package:tivi_tea/features/history/view/history_detail.dart';
import 'package:tivi_tea/features/history/view/history_view.dart';
import 'package:tivi_tea/features/home/view/client/client_dashboard.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/services/view/pages/scan_qr_code_view.dart';

class HomeRouter {
  static final serviceProviderDashboard = GoRoute(
    path: AppRoutes.serviceProviderDashboard,
    builder: (BuildContext context, GoRouterState state) {
      return const ServiceProviderDashboard();
    },
  );
  static final clientDashboard = GoRoute(
    path: AppRoutes.clientDashboard,
    builder: (BuildContext context, GoRouterState state) {
      return const ClientDashboard();
    },
  );
  static final bookingHistoryView = GoRoute(
    path: AppRoutes.bookingHistoryView,
    builder: (BuildContext context, GoRouterState state) {
      return const HistoryView();
    },
  );
  static final bookingHistoryDetailsView = GoRoute(
    path: AppRoutes.bookingHistoryDetails,
    builder: (BuildContext context, GoRouterState state) {
      final booking = state.extra as BookingHistoryModel;
      return HistoryDetailView(booking: booking);
    },
  );
  static final scanQRCodeView = GoRoute(
    path: AppRoutes.scanQRCodeView,
    builder: (BuildContext context, GoRouterState state) {
      final bookingId = state.extra as String;
      return ScanQRCodeView(bookingId: bookingId);
    },
  );
}
