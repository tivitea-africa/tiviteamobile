import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/registration/presentation/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/presentation/widgets/registration_scaffold.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateServiceProviderAccount extends StatefulWidget {
  const CreateServiceProviderAccount({super.key});

  @override
  State<CreateServiceProviderAccount> createState() =>
      _CreateServiceProviderAccountState();
}

class _CreateServiceProviderAccountState
    extends State<CreateServiceProviderAccount> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.spaceOrTool,
        headerSectionSubtitle: context.l10n.regIsEasy,
      ),
      body: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            //isEnabled = _formKey.currentState!.validate();
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextField(
                controller: firstNameController,
                label: context.l10n.firstName,
                hintText: context.l10n.firstNameHintText,
              ),
              AppTextField(
                controller: lastNameController,
                label: context.l10n.lastName,
                hintText: context.l10n.lastNameHintText,
              ),
              AppTextField(
                controller: phoneNumberController,
                label: context.l10n.phoneNumber,
                hintText: context.l10n.phoneNumberHintText,
              ),
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
                label: context.l10n.createPassword,
                hintText: context.l10n.createPasswordHintText,
                obscureText: true,
                suffixIcon: AppSvgWidget(
                  path: Assets.svgs.eye,
                  fit: BoxFit.scaleDown,
                ),
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.confirmPassword,
                hintText: context.l10n.confirmPasswordHintText,
                obscureText: true,
                suffixIcon: AppSvgWidget(
                  path: Assets.svgs.eye,
                  fit: BoxFit.scaleDown,
                ),
              ),
              20.verticalSpace,
              AppButton(
                buttonText: context.l10n.createAccount,
                onPressed: () {},
              ),
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
                      recognizer: TapGestureRecognizer()..onTap = () {},
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
}
