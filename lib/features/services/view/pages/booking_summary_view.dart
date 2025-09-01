import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/date_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/payment/view/payment_webview.dart';
import 'package:tivi_tea/features/payment/view_model/client/client_payment_notifier.dart';
import 'package:tivi_tea/features/services/model/book_work_tool_model.dart';
import 'package:tivi_tea/features/services/model/book_workspace_model.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view/widgets/listing_widget.dart';
import 'package:tivi_tea/features/services/view_model/booking_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookingSummaryView extends ConsumerStatefulWidget {
  final BookingSummaryParams params;
  const BookingSummaryView({super.key, required this.params});

  @override
  ConsumerState<BookingSummaryView> createState() => _BookingSummaryViewState();
}

class _BookingSummaryViewState extends ConsumerState<BookingSummaryView> {
  bool isBookingCompleted = false;
  String bookingId = "";
  @override
  Widget build(BuildContext context) {
    final paymentStatusLoadState = ref.watch(
      clientPaymentNotifierProvider.select(
        (value) => value.getPaymentStatusLoadState,
      ),
    );
    final isWorkSpace = widget.params.listing.listingType?.enumType == CreateListingType.workSpace;
    return AppScaffold(
      appbar: const CustomAppBar(
        showHamburgerMenu: true,
        showBackButtonForHomeScreenAppBar: true,
      ),
      body: (paymentStatusLoadState == LoadState.loading)
          ? const Center(child: CupertinoActivityIndicator())
          : Column(
              children: [
                30.verticalSpace,
                WorkSpaceWidget(listing: widget.params.listing),
                50.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DottedWidget(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 10.w,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                context.l10n.pickUpDate,
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(
                                  fontSize: 13.sp,
                                  color: const Color(0xFF737380),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                widget.params.selectedDateFrom.toMonthDate,
                                textAlign: TextAlign.center,
                                style: context.theme.textTheme.displaySmall
                                    ?.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                widget.params.selectedDateFrom.toTime,
                                textAlign: TextAlign.center,
                                style: context.theme.textTheme.displaySmall
                                    ?.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: DottedWidget(
                        padding: EdgeInsets.zero,
                        dashPattern: const [4, 7],
                        child: SizedBox(
                          width: context.width,
                        ),
                      ),
                    ),
                    Flexible(
                      child: DottedWidget(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 10.w,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                context.l10n.returnDate,
                                style: context.theme.textTheme.titleLarge
                                    ?.copyWith(
                                  fontSize: 13.sp,
                                  color: const Color(0xFF737380),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                widget.params.selectedDateTo.toMonthDate,
                                textAlign: TextAlign.center,
                                style: context.theme.textTheme.displaySmall
                                    ?.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                widget.params.selectedDateTo.toTime,
                                textAlign: TextAlign.center,
                                style: context.theme.textTheme.displaySmall
                                    ?.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: DottedWidget(
                    child: SizedBox(
                      width: context.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            AppSvgWidget(
                              path: Assets.svgs.location,
                              fit: BoxFit.cover,
                              width: 20,
                              height: 20,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isWorkSpace ? context.l10n.pickUpLocation : context.l10n.location,
                                  style: context.theme.textTheme.titleLarge
                                      ?.copyWith(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF737380),
                                  ),
                                ),
                                5.verticalSpace,
                                Text(
                                  widget.params.listing.address ?? '',
                                  textAlign: TextAlign.center,
                                  style: context.theme.textTheme.displaySmall
                                      ?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                50.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final loadState = ref.watch(bookingNotiferProvider.select(
                        (value) => value.loadState,
                      ));
                      final paymentLoadState =
                          ref.watch(clientPaymentNotifierProvider.select(
                        (value) => value.createPaymentLoadState,
                      ));
                      return AppButton(
                        isLoading: loadState == LoadState.loading ||
                            paymentLoadState == LoadState.loading,
                        buttonText: isBookingCompleted
                            ? context.l10n.payNow
                            : context.l10n.continue_,
                        onPressed: () {
                          if (isBookingCompleted == false) {
                            _submit(ref);
                          } else {
                            _proceedToPayment(bookingId);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void _submit(WidgetRef ref) async {
    final notifier = ref.read(bookingNotiferProvider.notifier);
    if (widget.params.listing.listingType?.enumType ==
        CreateListingType.workSpace) {
      final data = BookWorkSpaceModel(
        pickUpDate: widget.params.selectedDateFrom.toAcceptedDateTimeFormat,
        returnDate: widget.params.selectedDateTo.toAcceptedDateTimeFormat,
        numOfPeople: widget.params.numOfPeople,
        subListingId: widget.params.roomId,
      );
      notifier.bookWorkSpace(
        listingId: widget.params.listing.id ?? '',
        data: data,
        onSuccess: _onSuccess,
        onError: (message) => context.showError(message),
      );
    } else {
      final data = BookWorkToolModel(
        pickUpDate: widget.params.selectedDateFrom.toUtc().toAcceptedDateTimeFormat,
        returnDate: widget.params.selectedDateTo.toUtc().toAcceptedDateTimeFormat,
      );
      // debugLog(widget.params.selectedDateFrom.toUtc().toAcceptedDateTimeFormat);
      // debugLog(widget.params.selectedDateTo.toUtc().toAcceptedDateTimeFormat);
      // debugLog(data.toJson().toString());
      notifier.bookWorktool(
        listingId: widget.params.listing.id ?? '',
        data: data,
        onSuccess: _onSuccess,
        onError: (message) => context.showError(message),
      );
    }
  }

  void _onSuccess(String bookingId_) {
    context.showSuccess('Booking successful, proceed to payment');

    isBookingCompleted = true;
    bookingId = bookingId_;
    setState(() {});
  }

  void _proceedToPayment(String bookingId) {
    final paymentNotifier = ref.read(clientPaymentNotifierProvider.notifier);
    paymentNotifier.createPayment(
      bookingId,
      onSuccess: (response) {
        debugLog(response.authorizationUrl);
        _navigateToPaymentView(
          response.authorizationUrl ?? '',
          response.reference ?? '',
        );
      },
      onError: (message) => context.showError(message),
    );
  }

  void _showSuccessDialog() {
    final paymentId = ref.read(
      clientPaymentNotifierProvider.select((value) => value.paymentId),
    );
    if (mounted) {
      context.showCustomDialog(
        dismissible: false,
        child: AppSuccessContent(
          title: context.l10n.paymentSuccessful,
          subtitle: context.l10n.paymentWasSuccessful,
          buttonText: context.l10n.downloadEReceipt,
          secondButtonText: context.l10n.backToHome,
          onPressed: () {
            context.pop();
            context.go(
              '${AppRoutes.servicesView}/${AppRoutes.eReceiptView}',
              extra: [paymentId, bookingId],
            );
          },
          onSecondButtonPressed: () {
            context.pop();
            context.go(AppRoutes.homeView);
          },
        ),
      );
    }
  }

  void _navigateToPaymentView(String paymentUrl, String paymentId) {
    final args = PaymentWebviewArgs(
      bookingId: bookingId,
      paystackUrl: paymentUrl,
    );
    context.push(AppRoutes.paymentWebview, extra: args).then(
      (value) async {
        if (mounted) {
          final paymentNotifier = ref.read(
            clientPaymentNotifierProvider.notifier,
          );
          await paymentNotifier.getPaymentStatus(
            paymentId,
            onSuccess: (isSuccessful, status) {
              if (!isSuccessful) {
                context.showSuccess('Your transaction is $status');
                return;
              }
              if (mounted) {
                _showSuccessDialog();
              }
            },
            onError: (message) => context.showError(message),
          );
        }
      },
    );
  }
}

class DottedWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final List<double>? dashPattern;
  const DottedWidget({
    super.key,
    required this.child,
    this.radius = 15,
    this.dashPattern,
    this.padding = const EdgeInsets.all(2),
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(radius),
      padding: padding,
      color: const Color(0xFF9D9DAA).withValues(alpha: 0.5),
      dashPattern: dashPattern ?? const [5, 2],
      child: child,
    );
  }
}
