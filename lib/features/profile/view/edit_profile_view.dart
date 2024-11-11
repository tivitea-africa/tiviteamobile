import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_phone_text_field.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/profile/model/edit_profile_model.dart';
import 'package:tivi_tea/features/profile/view_model/profile_notifer.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class EditProfileView extends ConsumerStatefulWidget {
  const EditProfileView({super.key});

  @override
  ConsumerState<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailNameController = TextEditingController();

  bool isEnabled = false;
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final user = ref.watch(currentUserProvider);
    //   fullNameController.text = '${user.firstName} ${user.lastName}';
    //   emailNameController.text = user.email ?? '';
    // });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    return AppScaffold(
      appbar: const CustomAppBar(homeScreenAppBar: true),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(radius: 50),
                10.verticalSpace,
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 20.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvgWidget(path: Assets.svgs.lock),
                    5.horizontalSpace,
                    Text(
                      context.l10n.changePassword,
                      style: context.theme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  Form(
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
                            controller: fullNameController,
                            hintText: '${user.firstName} ${user.lastName}',
                            readOnly: true,
                            enabled: false,
                          ),
                          AppPhoneTextField(
                            initialValue: user.phoneNumber,
                            hintText: user.phoneNumber ?? '',
                            onChanged: (phone) {
                              phoneNumber = phone.completeNumber;
                              setState(() {});
                            },
                          ),
                          AppTextField(
                            controller: emailNameController,
                            hintText: user.email ?? '',
                            readOnly: true,
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  50.verticalSpace,
                  Consumer(
                    builder: (context, ref, _) {
                      final loadState = ref.watch(profileNotiferProvider.select(
                        (value) => value.editProfileLoadState,
                      ));
                      return AppButton(
                        isLoading: loadState == LoadState.loading,
                        isEnabled: phoneNumber.isNotEmpty,
                        buttonText: context.l10n.updateProfile.toUpperCase(),
                        onPressed: _submit,
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _submit() {
    final notifier = ref.read(profileNotiferProvider.notifier);
    final data = EditProfileModel(phoneNumber: phoneNumber);
    notifier.updateProfile(
      data,
      onSucess: () => context.showCustomDialog(
        child: AppSuccessContent(
          title: 'Success',
          subtitle: 'Profile Updated Successfully',
          buttonText: context.l10n.continue_,
          onPressed: () {
            context.pop();
            context.pushReplacement(AppRoutes.profile);
          },
        ),
      ),
      onError: (message) => context.showError(message)
    );
  }
}
