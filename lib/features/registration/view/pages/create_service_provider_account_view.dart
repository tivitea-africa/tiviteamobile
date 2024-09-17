import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
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
import 'package:tivi_tea/models/address_model.dart';

class CreateServiceProviderAccount extends ConsumerStatefulWidget {
  const CreateServiceProviderAccount({super.key});

  @override
  ConsumerState<CreateServiceProviderAccount> createState() =>
      _CreateServiceProviderAccountState();
}

class _CreateServiceProviderAccountState
    extends ConsumerState<CreateServiceProviderAccount> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateOrProvinceController =
      TextEditingController();
  final TextEditingController postalOrZipCodeController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;
  String phoneNumber = "";

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    stateOrProvinceController.dispose();
    postalOrZipCodeController.dispose();

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
              _FormSectionHeader(title: context.l10n.personalInfo),
              AppTextField(
                controller: firstNameController,
                validateFunction: Validators.name(),
                label: context.l10n.firstName,
                hintText: context.l10n.firstNameHintText,
              ),
              AppTextField(
                controller: lastNameController,
                validateFunction: Validators.name(),
                label: context.l10n.lastName,
                hintText: context.l10n.lastNameHintText,
              ),
              AppPhoneTextField(
                label: context.l10n.phoneNumber,
                hintText: context.l10n.phoneNumberHintText,
                // validateFunction: (phone) {
                //   Validators.phone(phone?.number);
                //   return phone?.completeNumber;
                // },
                onChanged: (phone) {
                  phoneNumber = phone;
                  setState(() {});
                },
              ),
              AppTextField(
                controller: emailController,
                label: context.l10n.email,
                hintText: context.l10n.emailHintText,
                validateFunction: Validators.email(),
                suffixIcon: AppSvgWidget(
                  path: Assets.svgs.envelope,
                  fit: BoxFit.scaleDown,
                ),
              ),
              _FormSectionHeader(title: context.l10n.locationDetails),
              AppTextField(
                controller: addressController,
                label: context.l10n.yourAddress,
                hintText: context.l10n.yourAddressHintText,
                validateFunction: Validators.notEmpty(),
              ),
              AppTextField(
                controller: cityController,
                label: context.l10n.city,
                validateFunction: Validators.notEmpty(),
              ),
              AppTextField(
                controller: countryController,
                label: context.l10n.country,
                validateFunction: Validators.notEmpty(),
              ),
              AppTextField(
                controller: stateOrProvinceController,
                label: context.l10n.stateOrProvince,
                validateFunction: Validators.notEmpty(),
              ),
              AppTextField(
                controller: postalOrZipCodeController,
                label: context.l10n.postalOrZipCode,
                validateFunction: Validators.notEmpty(),
              ),
              20.verticalSpace,
              AppButton(
                isEnabled: isEnabled,
                onPressed: _navigateToSecondView,
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSecondView() {
    final data = ServiceProviderSignUpRequestBody(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumber,
      email: emailController.text,
      address: Address(
        city: cityController.text,
        country: countryController.text,
        state: stateOrProvinceController.text,
        postalCode: postalOrZipCodeController.text,
      ),
    );

    final notifier = ref.read(registrationNotifierProvider.notifier);
    notifier.saveFirstViewRegistrationDetails(data);

    context.push(
      AppRoutes.createServiceProviderAccountSecondView,
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
