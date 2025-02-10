import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.bookingHistory,
        showHamburgerMenu: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CreateListingButton(
                    text: context.l10n.createBooking,
                    //onTap: () => context.push(createListingPath),
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
            20.verticalSpace,
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFD8D8DD),
                ),
              ),
              child: Column(
                children: [
                  Table(
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
                            child: Text(context.l10n.date),
                          ),
                        ],
                      ),
                      for (var i = 0; i < 10; i++)
                        TableRow(children: _buildRow(context)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRow(BuildContext context) {
    const bookingHistoryDetail =
        '${AppRoutes.homeView}${AppRoutes.bookingHistoryDetails}';
    return [
      GestureDetector(
        onTap: () => context.push(bookingHistoryDetail),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.colorScheme.onPrimaryContainer,
                ),
                child: AppImageWidget(
                  borderRadius: BorderRadius.circular(50),
                  imagePath: "user.profilePicture ?? ''",
                ),
              ),
              5.horizontalSpace,
              const Text("Victor Samuel"),
            ],
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(context.l10n.status),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(context.l10n.date),
      ),
    ];
  }
}
