import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/registration/presentation/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/presentation/widgets/registration_scaffold.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateServiceProviderAccountSecondView extends StatefulWidget {
  const CreateServiceProviderAccountSecondView({super.key});

  @override
  State<CreateServiceProviderAccountSecondView> createState() =>
      _CreateServiceProviderAccountSecondViewState();
}

class _CreateServiceProviderAccountSecondViewState
    extends State<CreateServiceProviderAccountSecondView> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.registerAsSpaceOwner,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayLarge,
              ),
              10.verticalSpace,
              Text(
                context.l10n.provideInfo,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displaySmall?.copyWith(
                  color: const Color(0xFF737380),
                ),
              ),
              20.verticalSpace,
              _FormSectionHeader(title: context.l10n.accountInfo),
              AppTextField(
                controller: firstNameController,
                label: context.l10n.username,
                hintText: context.l10n.username,
              ),
              AppTextField(
                controller: lastNameController,
                label: context.l10n.alternativePhone,
              ),
              AppTextField(
                controller: phoneNumberController,
                label: context.l10n.phoneNumber,
                hintText: context.l10n.phoneNumberHintText,
              ),
              AppTextField(
                controller: passwordController,
                label: context.l10n.createPassword,
                hintText: context.l10n.createPasswordHintText,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.confirmPasswordHintText,
              ),
              _FormSectionHeader(title: context.l10n.businessDetails),
              AppTextField(
                controller: passwordController,
                label: context.l10n.businessName,
                hintText: context.l10n.yourAddressHintText,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.registrationStatus,
              ),
              AppTextField(
                controller: passwordController,
                label: context.l10n.website,
                hintText: context.l10n.optional,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.businessDescription,
                hintText: context.l10n.briefDescription,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.postalOrZipCode,
                hintText: context.l10n.confirmPasswordHintText,
              ),
              _FormSectionHeader(title: context.l10n.bankDetails),
              AppTextField(
                controller: passwordController,
                label: context.l10n.bankName,
                hintText: context.l10n.bankName,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.accountName,
              ),
              AppTextField(
                controller: passwordController,
                label: context.l10n.accountNumber,
                hintText: context.l10n.accountNumber,
              ),
              20.verticalSpace,
              AppButton(
                onPressed: () {}
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _FormSectionHeader extends StatelessWidget {
  final String title;
  const _FormSectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.secondaryHeaderColor,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Text(
        title,
        style: context.theme.textTheme.bodyLarge,
      ),
    );
  }
}
