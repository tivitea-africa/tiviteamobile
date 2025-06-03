import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/client/client_dashboard.dart';
import 'package:tivi_tea/features/payment/view/widgets/payment_history_table.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(title: 'Payment', showHamburgerMenu: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CreateListingButton(
                  text: 'Order History',
                  onTap: () {},
                  showIcon: false,
                  hasWhiteBackground: true,
                ),
              ],
            ),
            10.verticalSpace,
            const PaymentHistoryTable(),
          ],
        ),
      ),
    );
  }
}
