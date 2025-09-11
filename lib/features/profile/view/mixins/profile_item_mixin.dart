import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/login/view_model/login_notifier.dart';
import 'package:tivi_tea/features/profile/model/profile_item_model.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

mixin ProfileItemMixin {
  List<ProfileItemModel> getProfileItems({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final user = ref.watch(userNotifierProvider);
    return [
      ProfileItemModel(
        label: '${user.firstName} ${user.lastName}',
        icon: Assets.svgs.profileEdit,
        onTap: () {},
      ),
      ProfileItemModel(
        label: user.phoneNumber ?? '',
        icon: Assets.svgs.profilePhone,
        onTap: () {},
      ),
      ProfileItemModel(
        label: user.email ?? '',
        icon: Assets.svgs.profileMail,
        onTap: () {},
      ),
      ProfileItemModel(
        label: context.l10n.changePassword,
        icon: Assets.svgs.profilePassword,
        onTap: () => context.push(
          '${AppRoutes.profile}/${AppRoutes.changePasswordView}',
        ),
      ),
      ProfileItemModel(
        label: 'Delete Account',
        isDeleteAccount: true,
        icon: Assets.svgs.logout,
        onTap: () => _showDeleteAccountDialog(context, ref),
      ),
    ];
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
