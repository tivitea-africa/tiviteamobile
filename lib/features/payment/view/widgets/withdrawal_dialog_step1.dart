import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/payment/model/withdrawal_account_model.dart';

class WithdrawalDialogStep1 extends StatelessWidget {
  final void Function(WithdrawalAccountModel) onNext;

  const WithdrawalDialogStep1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Receiving Bank',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        const AppTextField(
          label: 'Bank Name',
          hintText: 'Enter Bank Name',
        ),
        const AppTextField(
          label: 'Account Number',
        ),
        10.verticalSpace,
        Text(
          'Amount to Withdraw',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        const AppTextField(
          label: 'Amount',
          hintText: 'Enter Amount',
        ),
        10.verticalSpace,
        AppButton(
          onPressed: () {
            onNext(WithdrawalAccountModel(
              bankName: '',
              accountNumber: '',
              amount: 0,
            ));
          },
          buttonText: 'CONFIRM',
        ),
      ],
    );
  }
}
