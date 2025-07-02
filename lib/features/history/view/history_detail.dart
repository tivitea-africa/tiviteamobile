import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/config/extensions/date_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/features/services/view_model/booking_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';

class HistoryDetailView extends ConsumerStatefulWidget {
  final String bookingId;
  const HistoryDetailView({super.key, required this.bookingId});

  @override
  ConsumerState<HistoryDetailView> createState() => _HistoryDetailViewState();
}

class _HistoryDetailViewState extends ConsumerState<HistoryDetailView> {
  BookingHistoryModel? _booking;
  File? _eTicket;
  bool _recieptLoading = true;
  bool _isError = false;
  bool isCurrentTimeWithinCheckInPeriod = false;
  final ScreenshotController _screenController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final entityType = ref.read(userNotifierProvider).entityType;
      getBookingDetails();

      if (entityType == EntityType.client) {
        generateTicket();
      }
    });
  }

  void getBookingDetails() {
    final notifier = ref.read(bookingNotiferProvider.notifier);
    notifier.getSingleBookingDetails(widget.bookingId, onSuccess: (booking) {
      _booking = booking;
      isCurrentTimeWithinCheckInPeriod = booking.pickUpDate
              ?.isCurrentTimeWithinCheckInPeriod(
                  checkOutDate: booking.returnDate ?? DateTime.now()) ??
          false;
      setState(() {});
    });
  }

  void generateTicket() {
    _recieptLoading = true;
    setState(() {});
    final notifier = ref.read(bookingNotiferProvider.notifier);
    notifier.generateBookingTicket(widget.bookingId, onSuccess: (data) {
      setState(() {
        _eTicket = data;
        _isError = false;
        _recieptLoading = false;
      });
    }, onError: (message) {
      setState(() {
        _isError = true;
        _recieptLoading = false;
      });
      context.showError('An error occurred while e-Ticket');
    });
  }

  @override
  Widget build(BuildContext context) {
    final entityType = ref.read(userNotifierProvider).entityType;
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.bookingHistoryView,
        onTap: () => context.pop(),
      ),
      body: RefreshIndicator(
        onRefresh: () async => getBookingDetails(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 15) +
                  const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFD8D8DD),
                ),
              ),
              child: SingleChildScrollView(
                child: (_booking == null)
                    ? const Center(child: CupertinoActivityIndicator())
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRow(
                            context,
                            title: context.l10n.customer,
                            value:
                                '${_booking?.client?.user?.firstName ?? ''} ${_booking?.client?.user?.lastName ?? ''}',
                          ),
                          20.verticalSpace,
                          _buildRow(
                            context,
                            title: context.l10n.status,
                            value: _booking?.status ?? '',
                          ),
                          20.verticalSpace,
                          _buildRow(
                            context,
                            title: 'Service',
                            value: _booking?.listing?.listingType ?? '',
                          ),
                          20.verticalSpace,
                          _buildRow(
                            context,
                            title: 'Amount',
                            value: (_booking?.amount ?? 0).formatAmount,
                          ),
                          if (entityType == EntityType.partner) ...[
                            50.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: AppButton(
                                backgroundColor: Colors.white,
                                borderColor: context.theme.primaryColor,
                                textColor: context.theme.primaryColor,
                                buttonText: 'Scan QR Code',
                                onPressed: () => context.push(
                                  '${AppRoutes.homeView}${AppRoutes.scanQRCodeView}',
                                  extra: _booking?.id,
                                ),
                              ),
                            ),
                          ] else ...[
                            50.verticalSpace,
                            if (isCurrentTimeWithinCheckInPeriod)
                              Consumer(builder: (context, ref, child) {
                                final checkInCheckOutLoadState = ref.watch(
                                  bookingNotiferProvider.select(
                                    (state) => state.checkInCheckOutLoadState,
                                  ),
                                );
                                return AppButton(
                                  buttonText: 'Check in manually',
                                  borderColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  textColor: context.theme.primaryColor,
                                  isLoading: checkInCheckOutLoadState ==
                                      LoadState.loading,
                                  onPressed: () =>
                                      _checkInCheckOut(widget.bookingId),
                                );
                              }),
                            if (_recieptLoading)
                              const Center(
                                child: CupertinoActivityIndicator(),
                              )
                            else
                              (_eTicket == null)
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: EdgeInsets.only(bottom: 20.h),
                                      child: Screenshot(
                                        controller: _screenController,
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.6,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: PDFView(
                                            filePath: _eTicket?.path ?? '',
                                            enableSwipe: true,
                                            swipeHorizontal: true,
                                            autoSpacing: false,
                                            pageFling: false,
                                            backgroundColor: Colors.grey,
                                            fitPolicy: FitPolicy.BOTH,
                                            onRender: (pages) {
                                              debugLog('Total Pages: $pages');
                                            },
                                            onError: (error) {
                                              debugLog(
                                                  'PDF Error: ${error.toString()}');
                                            },
                                            onPageError: (page, error) {
                                              debugLog(
                                                  'PDF Page Error: $page: ${error.toString()}');
                                            },
                                            onViewCreated: (PDFViewController
                                                pdfViewController) {
                                              debugLog('PDF View Created');
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                            if (_isError)
                              AppButton(
                                buttonText: 'Retry',
                                borderColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                textColor: context.theme.primaryColor,
                                onPressed: () => generateTicket(),
                              ),
                          ]
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkInCheckOut(String bookingId) {
    final notifier = ref.read(bookingNotiferProvider.notifier);
    notifier.checkInCheckOut(
      bookingId,
      onSuccess: (message) => context.showSuccess(message),
      onError: (message) => context.showError(message),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    final amount = double.tryParse(value);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.theme.textTheme.displaySmall),
        amount == null
            ? Text(
                value,
                style: context.theme.textTheme.displaySmall?.copyWith(
                  color: Colors.grey,
                ),
              )
            : amount.getCurrencyText(),
      ],
    );
  }
}
