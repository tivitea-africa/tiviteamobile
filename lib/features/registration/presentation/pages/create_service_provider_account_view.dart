import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
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
              _FormSectionHeader(title: context.l10n.personalInfo),
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
              _FormSectionHeader(title: context.l10n.locationDetails),
              AppTextField(
                controller: passwordController,
                label: context.l10n.yourAddress,
                hintText: context.l10n.yourAddressHintText,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.city,
              ),
              AppTextField(
                controller: passwordController,
                label: context.l10n.country,
                hintText: context.l10n.createPasswordHintText,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.stateOrProvince,
                hintText: context.l10n.confirmPasswordHintText,
              ),
              AppTextField(
                controller: confirmPasswordController,
                label: context.l10n.postalOrZipCode,
                hintText: context.l10n.confirmPasswordHintText,
              ),
              20.verticalSpace,
              AppButton(
                onPressed: () => context.push(AppRoutes.createServiceProviderAccountSecondView),
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
