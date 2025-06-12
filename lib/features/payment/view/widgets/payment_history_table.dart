import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/features/common/app_paginator_widget.dart';
import 'package:tivi_tea/features/common/models/paginator_selector_model.dart';
import 'package:tivi_tea/features/payment/model/payment_history_model.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class PaymentHistoryTable extends StatefulWidget {
  const PaymentHistoryTable({super.key});

  @override
  State<PaymentHistoryTable> createState() => _PaymentHistoryTableState();
}

class _PaymentHistoryTableState extends State<PaymentHistoryTable> {
  final List<PaymentHistoryModel> paymentHistoryList = [];
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD8D8DD),
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Table(
                columnWidths: const {0: FlexColumnWidth(2)},
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Color(0xFFE1E1E6),
                    ),
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 5,
                        ),
                        child: Text('Customer'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(context.l10n.status),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text('Service'),
                      ),
                    ],
                  ),
                  for (var i = 0; i < paymentHistoryList.length; i++)
                    TableRow(
                      children: _buildRow(paymentHistoryList[i]),
                    ),
                ],
              ),
            ),
          ),
        ),
        10.verticalSpace,
        AppPaginatorWidget(
          paginatorSelectorModel: PaginatorSelectorModel(
            currentPage: _currentPage,
            totalPages: 1,
            totalItems: 0,
            itemsPerPage: 0,
          ),
          onPageChanged: _onPageChanged,
        ),
      ],
    );
  }

  void _onPageChanged(int page) {
    _currentPage = page;
    setState(() {});
  }

  List<Widget> _buildRow(PaymentHistoryModel paymentHistory) {
    // const bookingHistoryDetail =
    //     '${AppRoutes.homeView}${AppRoutes.bookingHistoryDetails}';
    return [
      GestureDetector(
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              //Container(
              //   width: 20.w,
              //   height: 20.h,
              //   margin: const EdgeInsets.symmetric(vertical: 5),
              //   padding: const EdgeInsets.all(5),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: context.theme.colorScheme.onPrimaryContainer,
              //   ),
              //   child: AppImageWidget(
              //     borderRadius: BorderRadius.circular(50),
              //     imagePath: booking.client?.user?.profilePicture ?? '',
              //   ),
              // ),
              // 5.horizontalSpace,
              // Text(
              //   '${booking.client?.user?.firstName ?? ''} ${booking.client?.user?.lastName ?? ''}',
              // ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(paymentHistory.status),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(paymentHistory.service),
      ),
    ];
  }
}
