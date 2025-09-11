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
    ];
  }
}
