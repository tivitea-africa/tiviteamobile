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
import 'package:tivi_tea/features/payment/view_model/partner/wallet_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class CreateOrUpdatePinDialog extends StatefulWidget {
  final bool isCreate;
  final Function(BuildContext context) onSuccess;
  const CreateOrUpdatePinDialog(
      {super.key, this.isCreate = true, required this.onSuccess});

  @override
  State<CreateOrUpdatePinDialog> createState() =>
      _CreateOrUpdatePinDialogState();
}

class _CreateOrUpdatePinDialogState extends State<CreateOrUpdatePinDialog> {
  final TextEditingController oldPinController = TextEditingController();
  final TextEditingController newPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();
  bool canConfirm = false;
  int pinLength = 4;

  @override
  void initState() {
    super.initState();

    Listenable.merge([
      oldPinController,
      newPinController,
      confirmPinController,
    ]).addListener(toggleCanConfirm);
  }

  void toggleCanConfirm() {
    canConfirm = widget.isCreate
        ? newPinController.text.length == pinLength &&
            confirmPinController.text.length == pinLength
        : oldPinController.text.length == pinLength &&
            newPinController.text.length == pinLength &&
            confirmPinController.text.length == pinLength;

    setState(() {});
  }

  @override
  void dispose() {
    oldPinController.dispose();
    newPinController.dispose();
    confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureOldPass = ValueNotifier(true);
    final ValueNotifier<bool> obscureNewPass = ValueNotifier(true);
    final ValueNotifier<bool> obscureConfirmPass = ValueNotifier(true);
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.isCreate ? 'Create a Transaction Pin' : 'Update Pin',
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontSize: 16.sp,
                  color: context.theme.primaryColor,
                ),
              ),
              10.verticalSpace,
              Text(
                'Please create a transaction pin to proceed to withdrawal',
                style: context.theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xFF748189),
                ),
              ),
              20.verticalSpace,
              if (!widget.isCreate)
                ValueListenableBuilder(
                  valueListenable: obscureOldPass,
                  builder: (context, obscurePassValue, child) {
                    return AppTextField(
                      controller: oldPinController,
                      label: 'Old Pin',
                      hintText: 'Enter Old Pin',
                      keyboardType: TextInputType.number,
                      obscureText: obscurePassValue,
                      maxLength: pinLength,
                      suffixIcon: InkWell(
                        onTap: () =>
                            obscureOldPass.value = !obscureOldPass.value,
                        child: AppSvgWidget(
                          path: obscurePassValue
                              ? Assets.svgs.eye
                              : Assets.svgs.eyeSlash,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  },
                ),
              ValueListenableBuilder(
                valueListenable: obscureNewPass,
                builder: (context, obscurePassValue, child) {
                  return AppTextField(
                    controller: newPinController,
                    label: 'New Pin',
                    hintText: 'Enter New Pin',
                    keyboardType: TextInputType.number,
                    obscureText: obscurePassValue,
                    maxLength: pinLength,
                    suffixIcon: InkWell(
                      onTap: () => obscureNewPass.value = !obscureNewPass.value,
                      child: AppSvgWidget(
                        path: obscurePassValue
                            ? Assets.svgs.eye
                            : Assets.svgs.eyeSlash,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: obscureConfirmPass,
                builder: (context, obscurePassValue, child) {
                  return AppTextField(
                    controller: confirmPinController,
                    label: 'Confirm Pin',
                    hintText: 'Enter Confirm Pin',
                    keyboardType: TextInputType.number,
                    obscureText: obscurePassValue,
                    maxLength: pinLength,
                    suffixIcon: InkWell(
                      onTap: () =>
                          obscureConfirmPass.value = !obscureConfirmPass.value,
                      child: AppSvgWidget(
                        path: obscurePassValue
                            ? Assets.svgs.eye
                            : Assets.svgs.eyeSlash,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  );
                },
              ),
              Center(
                child: Consumer(
                  builder: (context, ref, child) {
                    final isLoading = ref.watch(
                      walletNotifierProvider.select(
                        (state) =>
                            state.createTransactionPinState ==
                            LoadState.loading,
                      ),
                    );
                    return AppButton(
                      onPressed: () => createTransactionPin(ref),
                      buttonText: 'CONFIRM',
                      isLoading: isLoading,
                      isEnabled: isLoading == false && canConfirm,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createTransactionPin(WidgetRef ref) {
    final data = UpdatePinModel(
      oldPin: oldPinController.text,
      pin: newPinController.text,
      confirmPin: confirmPinController.text,
    );

    final notifier = ref.read(walletNotifierProvider.notifier);
    notifier.createTransactionPin(
      data: data,
      onSuccess: () => widget.onSuccess(context),
      onError: (e) => context.showError(e),
    );
  }
}
