import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/validators.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/login/view_model/login_notifier.dart';
import 'package:tivi_tea/features/profile/model/change_password_model.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(homeScreenAppBar: false),
      body: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            isEnabled = _formKey.currentState!.validate();
          });
        },
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    context.l10n.changePassword,
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    'Set a new password for your account',
                    style: context.theme.textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            50.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  AppTextField(
                    controller: oldPasswordController,
                    label: context.l10n.oldPassword,
                    hintText: context.l10n.enterPass,
                    validateFunction: Validators.name(),
                  ),
                  AppTextField(
                    controller: newPasswordController,
                    label: context.l10n.newPassword,
                    hintText: context.l10n.enterPass,
                    validateFunction: Validators.name(),
                  ),
                  AppTextField(
                    controller: confirmPasswordController,
                    label: context.l10n.confirmPassword,
                    hintText: context.l10n.confirmPassword,
                    // validateFunction: Validators.confirmPass(
                    //   newPasswordController.text,
                    //   confirmPasswordController.text,
                    // ),
                  ),
                  50.verticalSpace,
                  Consumer(
                    builder: (context, ref, _) {
                      final loadState = ref.watch(loginNotifierProvider.select(
                        (value) => value.changePasswordLoadState,
                      ));
                      return AppButton(
                        isLoading: loadState == LoadState.loading,
                        isEnabled: isEnabled,
                        buttonText: context.l10n.changePassword,
                        onPressed: () => _submit(ref),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit(WidgetRef ref) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    final data = ChangePasswordModel(
      oldPassword: oldPasswordController.text,
      newPassword: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    notifier.changePassword(
      data,
      onSuccess: () => context.showCustomDialog(
        child: AppSuccessContent(
          title: 'Success',
          subtitle: 'Password Changed Successfully',
          buttonText: context.l10n.continue_,
          onPressed: () {
            context.pop();
            context.pushReplacement(AppRoutes.loginView);
          },
        ),
      ),
      onError: (message) => context.showError(message),
    );
  }
}
