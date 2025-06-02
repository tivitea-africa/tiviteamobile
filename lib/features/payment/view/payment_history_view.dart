import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class PaymentHistoryView extends StatefulWidget {
  const PaymentHistoryView({super.key});

  @override
  State<PaymentHistoryView> createState() => _PaymentHistoryViewState();
}

class _PaymentHistoryViewState extends State<PaymentHistoryView> {
  bool isLoadingHistory = false;
  int _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        title: 'Payment History',
        showHamburgerMenu: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // CreateListingButton(
                //   text: entityType == EntityType.client
                //       ? context.l10n.createBooking
                //       : context.l10n.createListing,
                //   onTap: () => entityType == EntityType.client
                //       ? context.push(AppRoutes.servicesView)
                //       : context.push(createListingPath),
                // ),
                // 30.verticalSpace,
                (isLoadingHistory)
                    ? const CupertinoActivityIndicator()
                    : Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFD8D8DD),
                            ),
                          ),
                          child: RefreshIndicator(
                            onRefresh: () async {
                              // _currentPage = 1;
                              // final notifier =
                              //       ref.read(bookingNotiferProvider.notifier);
                              //   notifier.getBookingHistory(page: _currentPage);
                            },
                            child: Table(
                              columnWidths: const {0: FlexColumnWidth(2)},
                              children: [
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE1E1E6),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 5,
                                      ),
                                      child: Text(context.l10n.customer),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: Text(context.l10n.status),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: Text(context.l10n.price),
                                    ),
                                  ],
                                ),
                                // for (var i = 0;
                                //     i < bookingHistoryList.length;
                                //     i++)
                                //   TableRow(
                                //     children: _buildRow(
                                //       bookingHistoryList[i],
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // List<Widget> _buildRow(BookingHistoryModel booking) {
  //   const bookingHistoryDetail =
  //       '${AppRoutes.homeView}${AppRoutes.bookingHistoryDetails}';
  //   return [
  //     GestureDetector(
  //       onTap: () => context.push(bookingHistoryDetail, extra: booking),
  //       child: Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Row(
  //           children: [
  //             Container(
  //               width: 20.w,
  //               height: 20.h,
  //               margin: const EdgeInsets.symmetric(vertical: 5),
  //               padding: const EdgeInsets.all(5),
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: context.theme.colorScheme.onPrimaryContainer,
  //               ),
  //               child: AppImageWidget(
  //                 borderRadius: BorderRadius.circular(50),
  //                 imagePath: booking.client?.user?.profilePicture ?? '',
  //               ),
  //             ),
  //             5.horizontalSpace,
  //             Text(
  //               '${booking.client?.user?.firstName ?? ''} ${booking.client?.user?.lastName ?? ''}',
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     TableCell(
  //       verticalAlignment: TableCellVerticalAlignment.middle,
  //       child: Text(booking.status ?? ''),
  //     ),
  //     TableCell(
  //       verticalAlignment: TableCellVerticalAlignment.middle,
  //       child: booking.amount.getCurrencyText(),
  //     ),
  //   ];
  // }
}
