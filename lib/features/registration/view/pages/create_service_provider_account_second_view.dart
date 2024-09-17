import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/core/utils/validators.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_phone_text_field.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/registration/model/service_provider/service_provider_sign_up_request_body.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/registration/view_model/service_provider/registration_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class CreateServiceProviderAccountSecondView extends ConsumerStatefulWidget {
  final ServiceProviderSignUpRequestBody data;
  const CreateServiceProviderAccountSecondView({super.key, required this.data});

  @override
  ConsumerState<CreateServiceProviderAccountSecondView> createState() =>
      _CreateServiceProviderAccountSecondViewState();
}

class _CreateServiceProviderAccountSecondViewState
    extends ConsumerState<CreateServiceProviderAccountSecondView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController registrationStatusController =
      TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController businessDescriptionController =
      TextEditingController();

  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;
  String alternativePhoneNumber = "";

  @override
  void dispose() {
    userNameController.dispose();
    registrationStatusController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    websiteController.dispose();
    businessNameController.dispose();
    businessDescriptionController.dispose();

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
            isEnabled = _formKey.currentState!.validate();
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
                controller: userNameController,
                label: context.l10n.username,
                hintText: context.l10n.username,
                validateFunction: Validators.name(),
              ),
              AppPhoneTextField(
                label: context.l10n.alternativePhone,
                validateFunction: (phone) {
                  Validators.phone(phone?.number);
                  return phone?.completeNumber;
                },
                onChanged: (phone) {
                  alternativePhoneNumber = phone;
                  setState(() {});
                },
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
                validateFunction: Validators.confirmPass(
                  passwordController.text,
                  confirmPasswordController.text,
                ),
                obscureText: true,
                suffixIcon: AppSvgWidget(
                  path: Assets.svgs.eye,
                  fit: BoxFit.scaleDown,
                ),
              ),
              _FormSectionHeader(title: context.l10n.businessDetails),
              AppTextField(
                controller: businessNameController,
                label: context.l10n.businessName,
                hintText: context.l10n.businessName,
                validateFunction: Validators.name(),
              ),
              AppTextField(
                controller: registrationStatusController,
                label: context.l10n.registrationStatus,
                hintText: context.l10n.registeredOrIndividual,
                validateFunction: Validators.name(),
              ),
              AppTextField(
                controller: websiteController,
                label: context.l10n.website,
                hintText: context.l10n.optional,
              ),
              AppTextField(
                controller: businessDescriptionController,
                label: context.l10n.businessDescription,
                hintText: context.l10n.briefDescription,
                validateFunction: Validators.name(),
              ),
              _FormSectionHeader(title: context.l10n.bankDetails),
              AppTextField(
                controller: bankNameController,
                label: context.l10n.bankName,
                hintText: context.l10n.bankName,
                validateFunction: Validators.name(),
              ),
              AppTextField(
                controller: accountNameController,
                label: context.l10n.accountName,
                validateFunction: Validators.name(),
              ),
              AppTextField(
                controller: accountNumberController,
                label: context.l10n.accountNumber,
                hintText: context.l10n.accountNumber,
                validateFunction: Validators.accountNumber(),
              ),
              20.verticalSpace,
              Consumer(
                builder: (context, ref, _) {
                  final loadState =
                      ref.read(registrationNotifierProvider).loadState;
                  final isLoading = loadState == LoadState.loading;
                  return AppButton(
                    onPressed: _submit,
                    isLoading: isLoading,
                    isEnabled: isEnabled,
                  );
                },
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    final completeData = widget.data.copyWith(
      alternatePhoneNumber: alternativePhoneNumber,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      companyName: businessNameController.text,
      businessType: registrationStatusController.text,
      businessDescription: businessDescriptionController.text,
    );

    debugLog(completeData.toString());

    final notifier = ref.read(registrationNotifierProvider.notifier);
    notifier.signUpAsServiceProvider(
      completeData,
      onSuccess: () => debugLog('Successfully registered'),
      onError: (error) => debugLog('Error => $error'),
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
