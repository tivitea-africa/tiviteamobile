import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/profile/model/profile_item_model.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

mixin ProfileItemMixin {
  List<ProfileItemModel> getProfileItems({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final user = ref.watch(currentUserProvider);
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
        onTap: () {},
      ),
    ];
  }
}
