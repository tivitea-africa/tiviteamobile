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
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
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
  final BookingHistoryModel booking;
  const HistoryDetailView({super.key, required this.booking});

  @override
  ConsumerState<HistoryDetailView> createState() => _HistoryDetailViewState();
}

class _HistoryDetailViewState extends ConsumerState<HistoryDetailView> {
  File? _eTicket;
  bool _recieptLoading = true;
  bool _isCheckInDateStillValid = false;
  // bool _isGeneratingImageForSharing = false;
  bool _isError = false;
  final ScreenshotController _screenController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final entityType = ref.read(userNotifierProvider).entityType;
      final pickUpDate = widget.booking.pickUpDate?.toLocal();
      final returnDate = widget.booking.returnDate?.toLocal();
      final currentTime = DateTime.now().toLocal();

      _isCheckInDateStillValid = pickUpDate != null &&
          returnDate != null &&
          currentTime.isAfter(pickUpDate) &&
          currentTime.isBefore(returnDate);

      debugLog('pickUpDate: ${widget.booking.pickUpDate?.toLocal()}');
      debugLog('returnDate: ${widget.booking.returnDate?.toLocal()}');
      debugLog('currentTime: $currentTime');
      debugLog('isWithinBookingPeriod: $_isCheckInDateStillValid');

      if (entityType == EntityType.client) {
        generateTicket();
      }
    });
  }

  void generateTicket() {
    _recieptLoading = true;
    setState(() {});
    final notifier = ref.read(bookingNotiferProvider.notifier);
    notifier.generateBookingTicket(widget.booking.id ?? '', onSuccess: (data) {
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
        onTap: () {
          debugLog('onTap');
        },
      ),
      body: Padding(
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(
                  context,
                  title: context.l10n.customer,
                  value:
                      '${widget.booking.client?.user?.firstName ?? ''} ${widget.booking.client?.user?.lastName ?? ''}',
                ),
                20.verticalSpace,
                _buildRow(
                  context,
                  title: context.l10n.status,
                  value: widget.booking.status ?? '',
                ),
                20.verticalSpace,
                _buildRow(
                  context,
                  title: 'Service',
                  value: widget.booking.listing?.listingType ?? '',
                ),
                20.verticalSpace,
                _buildRow(
                  context,
                  title: 'Amount',
                  value: (widget.booking.listing?.amount ?? 0).formatAmount,
                ),
                if (entityType == EntityType.partner &&
                    _isCheckInDateStillValid) ...[
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
                      ),
                    ),
                  ),
                ] else ...[
                  50.verticalSpace,
                  if (_isCheckInDateStillValid && _recieptLoading)
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
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                width: MediaQuery.of(context).size.width,
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
                                    debugLog('PDF Error: ${error.toString()}');
                                  },
                                  onPageError: (page, error) {
                                    debugLog(
                                        'PDF Page Error: $page: ${error.toString()}');
                                  },
                                  onViewCreated:
                                      (PDFViewController pdfViewController) {
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
