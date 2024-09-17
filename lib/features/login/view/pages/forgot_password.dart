import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_onboarding_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/view_model/service_provider/login_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController emailNameController = TextEditingController();

  @override
  void dispose() {
    emailNameController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      body: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            isEnabled = _formKey.currentState!.validate();
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.forgotPassword,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.displayLarge,
            ),
            10.verticalSpace,
            Text(
              context.l10n.enterYourEmailForReset,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.displaySmall?.copyWith(
                color: const Color(0xFF737380),
              ),
            ),
            20.verticalSpace,
            AppTextField(
              controller: emailNameController,
              label: context.l10n.email,
              hintText: context.l10n.emailHintText,
              suffixIcon: AppSvgWidget(
                path: Assets.svgs.envelope,
                fit: BoxFit.scaleDown,
              ),
            ),
            20.verticalSpace,
            Consumer(builder: (context, ref, _) {
              final loadState = ref.watch(
                loginNotifierProvider.select(
                  (value) => value.forgotPasswordLoadState,
                ),
              );
              final isLoading = loadState == LoadState.loading;
              return AppButton(
                buttonText: context.l10n.sendLink,
                isEnabled: isEnabled,
                isLoading: isLoading,
                onPressed: () => _forgotPassword(ref),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _forgotPassword(WidgetRef ref) {
    final data = ForgotPasswordRequestObject(email: emailNameController.text);
    final notifier = ref.read(loginNotifierProvider.notifier);
    notifier.forgotPassword(
      data,
      onSuccess: () => context.pushReplacement(AppRoutes.loginView),
      onError: (error) => debugLog(error),
    );
  }
}
