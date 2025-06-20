import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/payment/model/wallet_details_model.dart';
import 'package:tivi_tea/features/payment/model/withdrawal_account_model.dart';
import 'package:tivi_tea/features/payment/view_model/partner/wallet_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class WithdrawalDialogStep1 extends StatefulWidget {
  final void Function() onWithdrawalSuccess;

  const WithdrawalDialogStep1({super.key, required this.onWithdrawalSuccess});

  @override
  State<WithdrawalDialogStep1> createState() => _WithdrawalDialogStep1State();
}

class _WithdrawalDialogStep1State extends State<WithdrawalDialogStep1> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  bool canConfirm = false;

  @override
  void initState() {
    super.initState();
    Listenable.merge([
      amountController,
      pinController,
    ]).addListener(toggleCanConfirm);
  }

  void toggleCanConfirm() {
    canConfirm =
        amountController.text.isNotEmpty && pinController.text.length == 4;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscurePass = ValueNotifier(true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount to Withdraw',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        AppTextField(
          controller: amountController,
          label: 'Amount',
          hintText: 'Enter Amount',
          keyboardType: TextInputType.number,
        ),
        ValueListenableBuilder(
            valueListenable: obscurePass,
            builder: (context, obscurePassValue, child) {
              return AppTextField(
                controller: pinController,
                label: 'Pin',
                hintText: 'Enter Pin',
                keyboardType: TextInputType.number,
                obscureText: obscurePassValue,
                maxLength: 4,
                suffixIcon: InkWell(
                  onTap: () => obscurePass.value = !obscurePass.value,
                  child: AppSvgWidget(
                    path: obscurePassValue
                        ? Assets.svgs.eye
                        : Assets.svgs.eyeSlash,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              );
            }),
        Consumer(
          builder: (context, ref, child) {
            final isLoading = ref.watch(
              walletNotifierProvider.select(
                (state) => state.withdrawFromWalletState == LoadState.loading,
              ),
            );
            return Center(
              child: AppButton(
                onPressed: () => withdrawFromWallet(ref),
                buttonText: 'CONFIRM',
                isLoading: isLoading,
                isEnabled: isLoading == false && canConfirm,
              ),
            );
          }
        ),
      ],
    );
  }

  void withdrawFromWallet(WidgetRef ref) {
    final notifier = ref.read(walletNotifierProvider.notifier);
    notifier.withdrawFromWallet(
      data: WithdrawFromWalletModel(
        amount: amountController.text,
        pin: pinController.text,
      ),
      onSuccess: () => widget.onWithdrawalSuccess(),
      onError: (e) => context.showError(e.toString()),
    );
  }
}
