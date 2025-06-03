import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/payment/model/withdrawal_account_model.dart';

class WithdrawalDialogStep2 extends StatelessWidget {
  final WithdrawalAccountModel withdrawalAccount;
  final VoidCallback onWithdraw;
  const WithdrawalDialogStep2({
    super.key,
    required this.withdrawalAccount,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Withdraw to this account?',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        Text(
          'Mike Morgan',
          style: context.theme.textTheme.displayLarge?.copyWith(
            fontSize: 24.sp,
            color: const Color(0xFF4E5458),
          ),
        ),
        10.verticalSpace,
        Text(
          withdrawalAccount.accountNumber,
          style: context.theme.textTheme.bodyMedium?.copyWith(
            fontSize: 16.sp,
            color: const Color(0xFF4E5458),
          ),
        ),
        10.verticalSpace,
        withdrawalAccount.amount.getCurrencyText(
          style: context.theme.textTheme.bodyMedium?.copyWith(
            fontSize: 32.sp,
            color: const Color(0xFF4E5458),
          ),
        ),
        10.verticalSpace,
        AppButton(
          onPressed: onWithdraw,
          buttonText: 'WITHDRAW',
        ),
      ],
    );
  }
}
