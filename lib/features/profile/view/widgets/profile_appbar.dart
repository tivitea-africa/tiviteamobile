import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/profile/view/widgets/profile_appbar_header.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const ProfileAppbarHeader(),
        AnimatedPositioned(
          left: 0,
          right: 0,
          bottom: -80,
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              const CircleAvatar(radius: 50),
              5.horizontalSpace,
              Text(
                '${user.firstName} ${user.lastName}',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  color: context.theme.primaryColor,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
