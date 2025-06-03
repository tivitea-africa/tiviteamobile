import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/client/client_dashboard.dart';
import 'package:tivi_tea/features/payment/view/widgets/withdrawal_dialog.dart';
import 'package:tivi_tea/features/payment/view/widgets/withdrawal_history_table.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class WithdrawalView extends StatelessWidget {
  const WithdrawalView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(
        title: 'Withdrawals',
        showHamburgerMenu: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CreateListingButton(
                  text: 'Withdraw',
                  onTap: () => context.showCustomDialog(
                    child: const WithdrawalDialog(),
                  ),
                  showIcon: false,
                ),
              ],
            ),
            20.verticalSpace,
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFC6E3E5),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC6E3E5),
                    ),
                    child: SvgPicture.asset(
                      Assets.svgs.balanceIcon,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance',
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF748189),
                        ),
                      ),
                      10.verticalSpace,
                      250.getCurrencyText(
                        style: context.theme.textTheme.displayLarge?.copyWith(
                          color: const Color(0xFF748189),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Row(
              children: [
                Text(
                  'Withdrawal History',
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontSize: 18.sp,
                    color: context.theme.primaryColor,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            const WithdrawalHistoryTable(),
          ],
        ),
      ),
    );
  }
}
