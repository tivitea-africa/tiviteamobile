import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/kyc/view/widgets/bottom_sheet_widget.dart';
import 'package:tivi_tea/features/login/view_model/login_notifier.dart';
import 'package:tivi_tea/features/profile/model/edit_profile_model.dart';
import 'package:tivi_tea/features/profile/view_model/profile_notifer.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userNotifierProvider);
    final entityType = user.entityType ?? EntityType.client;

    const createListingPath =
        '${AppRoutes.myListingView}/${AppRoutes.createListingView}';

    return AppScaffold(
      appbar: const CustomAppBar(showHamburgerMenu: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.settings,
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontSize: 20.sp,
                    color: context.theme.primaryColor,
                  ),
                ),
                if (entityType == EntityType.partner)
                  CreateListingButton(
                    text: context.l10n.createWorkspace,
                    onTap: () => context.push(createListingPath),
                  ),
              ],
            ),
            40.verticalSpace,
            Text(
              context.l10n.personalInfo,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                fontSize: 18.sp,
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _settingsOptionText(
                  context.l10n.uploadPicture,
                  context: context,
                  onTap: () => _showBottomSheet(context, ref),
                ),
                _settingsOptionText(
                  context.l10n.editProfile,
                  context: context,
                  onTap: () => context.push(
                    '${AppRoutes.profile}/${AppRoutes.editProfileView}',
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            Text(
              context.l10n.securityInformation,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                fontSize: 18.sp,
              ),
            ),
            20.verticalSpace,
            _settingsOptionText(
              context.l10n.changePassword,
              context: context,
              onTap: () => context.push(
                '${AppRoutes.profile}/${AppRoutes.changePasswordView}',
              ),
            ),
            10.verticalSpace,
            _settingsOptionText(
              'Delete Account',
              context: context,
              isDeleteAccount: true,
              onTap: () => _showDeleteAccountDialog(context, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsOptionText(
    String text, {
    required BuildContext context,
    bool isDeleteAccount = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: context.theme.textTheme.bodyMedium?.copyWith(
          fontSize: 15.sp,
          color: isDeleteAccount ? AppColors.danger : const Color(0xFF001DB6),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, WidgetRef ref) {
    context.showBottomSheet(
      title: context.l10n.uploadDocument,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomSheetWidget(
              chooseFileType: ChooseFileType.takePhoto,
              onImageSelected: (file) => _updateProfilePic(file, ref, context),
            ),
            20.horizontalSpace,
            BottomSheetWidget(
              chooseFileType: ChooseFileType.selectFromGallery,
              onImageSelected: (file) => _updateProfilePic(file, ref, context),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfilePic(
    XFile file,
    WidgetRef ref,
    BuildContext context,
  ) async {
    final notifier = ref.read(profileNotiferProvider.notifier);
    final user = ref.read(userRepositoryProvider).getUser();
    final image = await _uploadImages(file, ref);
    final data = EditProfileModel(
      phoneNumber: user.phoneNumber,
      profilePicture: image.first,
    );
    notifier.updateProfile(
      data,
      onSuccess: () {
        context.showSuccess('Profile Picture successfully uploaded');
        ref.read(userNotifierProvider.notifier).refreshUser();
      },
      onError: (message) => context.showError(message),
    );
  }

  Future<List<String>> _uploadImages(XFile file, WidgetRef ref) async {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final imageUrls = await notifier.uploadImages([file]);

    return imageUrls;
  }

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    context.showCustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete Account',
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          20.verticalSpace,
          Text(
            'Are you sure you want to delete your account? This action cannot be undone.',
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium,
          ),
          30.verticalSpace,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  buttonText: 'Cancel',
                  onPressed: () => context.pop(),
                  backgroundColor: Colors.grey,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: AppButton(
                  buttonText: 'Delete',
                  onPressed: () {
                    context.pop();
                    _deleteAccount(context, ref);
                  },
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _deleteAccount(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    loginNotifier.deleteAccount(
      onSuccess: () {
        // Navigate to select user type view
        context.go(AppRoutes.selectUserTypeView);
      },
      onError: (error) {
        context.showError('Error deleting account: $error');
      },
    );
  }
}
