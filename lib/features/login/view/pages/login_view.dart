import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_checkbox.dart';
import 'package:tivi_tea/features/common/app_onboarding_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/view_model/service_provider/login_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  @override
  void dispose() {
    emailNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              context.l10n.login,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.displayLarge,
            ),
            10.verticalSpace,
            Text(
              context.l10n.provideCredentials,
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
            AppTextField(
              controller: passwordController,
              label: context.l10n.enterPass,
              hintText: context.l10n.createPasswordHintText,
              obscureText: true,
              suffixIcon: AppSvgWidget(
                path: Assets.svgs.eye,
                fit: BoxFit.scaleDown,
              ),
            ),
            Row(
              children: [
                AppCheckbox(
                  onChanged: (value) {},
                ),
                5.horizontalSpace,
                Text(
                  context.l10n.rememberMe,
                  style: context.theme.textTheme.labelSmall,
                ),
                const Spacer(),
                InkWell(
                  onTap: () => context.push(AppRoutes.forgotPasswordView),
                  child: Text(
                    '${context.l10n.forgotPassword}?',
                    style: context.theme.textTheme.labelSmall
                        ?.copyWith(color: AppColors.danger),
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            Consumer(builder: (context, ref, _) {
              final loadState = ref.watch(
                loginNotifierProvider.select(
                  (value) => value.loadState,
                ),
              );
              final isLoading = loadState == LoadState.loading;
              return AppButton(
                buttonText: context.l10n.logIntoAccount,
                isLoading: isLoading,
                isEnabled: isEnabled,
                onPressed: () => _login(ref),
              );
            }),
            10.verticalSpace,
            AppButton(
              buttonText: context.l10n.googleContinue,
              backgroundColor: Colors.white,
              borderColor: const Color(0xFFD8D8DD),
              textStyle: context.theme.textTheme.displaySmall?.copyWith(
                color: const Color(0xFF737380),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Assets.images.google.image(
                  fit: BoxFit.scaleDown,
                  width: 20,
                ),
              ),
              onPressed: () {},
            ),
            10.verticalSpace,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: context.l10n.dontHaveAccount,
                style: context.theme.textTheme.displaySmall,
                children: [
                  TextSpan(
                    text: context.l10n.signUp,
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFEC8305),
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => context.push(AppRoutes.selectUserTypeView),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login(WidgetRef ref) {
    final data = LoginRequestObject(
      email: emailNameController.text,
      password: passwordController.text,
    );

    final notifier = ref.read(loginNotifierProvider.notifier);
    notifier.loginAsServiceProvider(
      data,
      onSuccess: () => context.pushReplacement(AppRoutes.loginView),
      onError: (error) => debugLog(error),
    );
  }
}
