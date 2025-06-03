import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/features/common/app_paginator_widget.dart';
import 'package:tivi_tea/features/common/models/paginator_selector_model.dart';
import 'package:tivi_tea/features/payment/model/withdrawal_history_model.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class WithdrawalHistoryTable extends StatefulWidget {
  const WithdrawalHistoryTable({super.key});

  @override
  State<WithdrawalHistoryTable> createState() => _WithdrawalHistoryTableState();
}

class _WithdrawalHistoryTableState extends State<WithdrawalHistoryTable> {
  final List<WithdrawalHistoryModel> withdrawalHistoryList = [];
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
            onRefresh: () async {
              // TODO: Implement refresh
            },
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
                        child: Text('Amount'),
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
                        child: Text(context.l10n.date),
                      ),
                    ],
                  ),
                  for (var i = 0; i < withdrawalHistoryList.length; i++)
                    TableRow(
                      children: _buildRow(withdrawalHistoryList[i]),
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

  List<Widget> _buildRow(WithdrawalHistoryModel withdrawalHistory) {
    // const bookingHistoryDetail =
    //     '${AppRoutes.homeView}${AppRoutes.bookingHistoryDetails}';
    return [
      GestureDetector(
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
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
        child: Text(withdrawalHistory.status),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: withdrawalHistory.amount.getCurrencyText(),
      ),
    ];
  }
}
