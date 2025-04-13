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
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/services/model/create_foot_soldier_model.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';

class CreateFootSoldierView extends StatefulWidget {
  const CreateFootSoldierView({super.key});

  @override
  State<CreateFootSoldierView> createState() => _CreateFootSoldierViewState();
}

class _CreateFootSoldierViewState extends State<CreateFootSoldierView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(homeScreenAppBar: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Form(
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
                20.verticalSpace,
                Text(
                  'Create Foot Soldier',
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 16.sp,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Foot Soldiers are essential to ensuring timely and efficient delivery, monitoring and pick-up of tools for our users!',
                  style: context.theme.textTheme.displaySmall?.copyWith(
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                30.verticalSpace,
                AppTextField(
                  controller: firstNameController,
                  label: 'First Name',
                  hintText: 'Enter First Name',
                  validateFunction: Validators.name(),
                ),
                AppTextField(
                  controller: lastNameController,
                  label: 'Last Name',
                  hintText: 'Enter Last Name',
                  validateFunction: Validators.name(),
                ),
                AppTextField(
                  controller: emailController,
                  label: 'Email',
                  hintText: 'Enter Email',
                  validateFunction: Validators.email(),
                ),
                AppTextField(
                  controller: phoneNumberController,
                  label: 'Phone Number',
                  hintText: 'Enter Phone Number',
                  validateFunction: Validators.phone(),
                ),
                AppTextField(
                  controller: addressController,
                  label: 'Address',
                  hintText: 'Enter Address',
                  validateFunction: Validators.name(),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final loadState =
                        ref.watch(partnerServicesNotiferProvider.select(
                      (value) => value.createFootSoldierLoadState,
                    ));
                    return Center(
                      child: AppButton(
                        isLoading: loadState == LoadState.loading,
                        isEnabled: isEnabled,
                        buttonText: 'Create Foot Soldier',
                        onPressed: () => _submit(ref),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit(WidgetRef ref) {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final data = CreateFootSoldierModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      address: addressController.text,
    );

    notifier.createFootSoldier(
      data: data,
      onSuccess: (_) async {
        context.showSuccess('Foot Soldier created successfully');
        await Future.delayed(const Duration(seconds: 1));
        _navigateToAddAccountPage();
      },
      onError: (error) {
        context.showError(error.toString());
      },
    );
  }

  void _navigateToAddAccountPage() => context.push(
        '${AppRoutes.servicesView}/${AppRoutes.createTransferRecepientView}',
        extra: emailController.text,
      );
}
