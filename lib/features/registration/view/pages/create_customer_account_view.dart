import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/core/utils/validators.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_phone_text_field.dart';
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/registration/model/client/customer_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/registration/view_model/client/customer_registration_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateCustomerAccount extends StatefulWidget {
  const CreateCustomerAccount({super.key});

  @override
  State<CreateCustomerAccount> createState() => _CreateCustomerAccountState();
}

class _CreateCustomerAccountState extends State<CreateCustomerAccount> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isEnabled = false;
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  bool obscurePass = true;
  bool obscureConfirmPass = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void _obscurePass() {
    obscurePass = !obscurePass;
    setState(() {});
  }

  void _obscureConfirmPass() {
    obscureConfirmPass = !obscureConfirmPass;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: const RegistrationAppBar(),
      body: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            isEnabled = _formKey.currentState!.validate();
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextField(
                controller: firstNameController,
                label: context.l10n.firstName,
                hintText: context.l10n.firstNameHintText,
                validateFunction: Validators.name(),
              ),
              AppTextField(
                controller: lastNameController,
                label: context.l10n.lastName,
                hintText: context.l10n.lastNameHintText,
                validateFunction: Validators.name(),
              ),
              AppPhoneTextField(
                //controller: phoneNumberController,
                label: context.l10n.phoneNumber,
                hintText: context.l10n.phoneNumberHintText,
                onChanged: (phone) {
                  phoneNumber = phone;
                  setState(() {});
                },
                //validateFunction: Validators.name(),
              ),
              AppTextField(
                controller: emailNameController,
                label: context.l10n.email,
                hintText: context.l10n.emailHintText,
                suffixIcon: AppSvgWidget(
                  path: Assets.svgs.envelope,
                  fit: BoxFit.scaleDown,
                ),
                validateFunction: Validators.email(),
              ),
              AppTextField(
                controller: passwordController,
                label: context.l10n.createPassword,
                hintText: context.l10n.createPasswordHintText,
                obscureText: obscurePass,
                suffixIcon: InkWell(
                  onTap: _obscurePass,
                  child: AppSvgWidget(
                    path: obscurePass ? Assets.svgs.eye : Assets.svgs.eyeSlash,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.confirmPassword,
                hintText: context.l10n.confirmPasswordHintText,
                obscureText: obscureConfirmPass,
                suffixIcon: InkWell(
                  onTap: _obscureConfirmPass,
                  child: AppSvgWidget(
                    path: obscureConfirmPass
                        ? Assets.svgs.eye
                        : Assets.svgs.eyeSlash,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                // validateFunction: Validators.confirmPass(
                //   passwordController.text,
                //   confirmPasswordController.text,
                // ),
              ),
              20.verticalSpace,
              Consumer(builder: (context, ref, _) {
                final loadState =
                    ref.watch(customerRegistrationNotifierProvider).loadState;
                final isLoading = loadState == LoadState.loading;
                debugLog('isLoading => $isLoading');
                return AppButton(
                  buttonText: context.l10n.createAccount,
                  isEnabled: isEnabled,
                  isLoading: isLoading,
                  onPressed: () => _submit(ref),
                );
              }),
              10.verticalSpace,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: context.l10n.alreadyHaveAccount,
                  style: context.theme.textTheme.displaySmall,
                  children: [
                    TextSpan(
                      text: context.l10n.login,
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFFEC8305),
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push(AppRoutes.loginView),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              AppButton(
                buttonText: context.l10n.googleSignUp,
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
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void _submit(WidgetRef ref) {
    final data = CustomerSignUpRequestBody(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailNameController.text,
      phoneNumber: phoneNumber,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    final notifier = ref.read(customerRegistrationNotifierProvider.notifier);
    notifier.signUpAsCustomer(
      data,
      onSuccess: (message) {
        context.showCustomDialog(
          child: AppSuccessContent(
            title: 'Success',
            subtitle: message,
            buttonText: context.l10n.proceedToLogin,
            onPressed: () => context.pushReplacement(AppRoutes.loginView),
          ),
        );
      },
      onError: (error) => context.showError(error),
    );
  }
}
