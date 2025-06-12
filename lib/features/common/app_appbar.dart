import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_navbar.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/customizable_row.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.homeScreenAppBar = false,
    this.showBackButton = true,
    this.showBackButtonForHomeScreenAppBar = false,
    this.showHamburgerMenu = false,
    this.title,
    this.userName,
    this.onTap,
    this.color,
    this.padding,
    super.key,
  });
  final bool homeScreenAppBar;
  final bool showHamburgerMenu;
  final bool showBackButton;
  final bool showBackButtonForHomeScreenAppBar;
  final String? title;
  final String? userName;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userRepositoryProvider).getUser();
    return Container(
      padding: padding ??
          EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 18.w,
            right: 18.w,
            bottom: 10.h,
          ),
      decoration: BoxDecoration(color: color ?? Colors.white),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          if (homeScreenAppBar) ...[
            Builder(
              builder: (context) {
                return InkWell(
                  onTap: () => showBackButtonForHomeScreenAppBar
                      ? context.pop()
                      : scaffoldKey.currentState?.openDrawer(),
                  child: AppSvgWidget(
                    path: showBackButtonForHomeScreenAppBar
                        ? Assets.svgs.chevronLeft
                        : Assets.svgs.hamburger,
                  ),
                );
              },
            ),
            const Spacer(),
            AppSvgWidget(path: Assets.svgs.notificationIcon),
            10.horizontalSpace,
            user.profilePicture == null
                ? const CircleAvatar()
                : Container(
                    width: 40.w,
                    height: 40.h,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.theme.colorScheme.onPrimaryContainer,
                    ),
                    child: AppImageWidget(
                      borderRadius: BorderRadius.circular(50),
                      imagePath: user.profilePicture ?? '',
                    ),
                  ),
          ] else ...[
            Expanded(
              child: CustomizableRow(
                flexValues: const [1, 4, 0],
                children: [
                  if (showHamburgerMenu)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Builder(
                        builder: (context) {
                          return InkWell(
                            onTap: () => showBackButtonForHomeScreenAppBar
                                ? context.pop()
                                : scaffoldKey.currentState?.openDrawer(),
                            child: showBackButtonForHomeScreenAppBar
                                ? IconButton(
                                    onPressed: () => context.pop(),
                                    icon: const Icon(
                                      CupertinoIcons.chevron_back,
                                    ),
                                  )
                                : AppSvgWidget(
                                    path: showBackButtonForHomeScreenAppBar
                                        ? Assets.svgs.chevronLeft
                                        : Assets.svgs.hamburger,
                                  ),
                          );
                        },
                      ),
                    )
                  else
                    switch (showBackButton) {
                      true => IconButton(
                          onPressed: () => onTap ?? () => context.pop(),
                          icon: const Icon(CupertinoIcons.chevron_back),
                        ),
                      // AppSvgWidget(
                      //     path: Assets.svgs.chevronLeft,
                      //     onTap: onTap ?? () => context.pop(),
                      //   ),
                      _ => const SizedBox(),
                    },
                  Center(
                    child: Text(
                      title ?? '',
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      AppSvgWidget(path: Assets.svgs.notificationIcon),
                      10.horizontalSpace,
                      user.profilePicture == null
                          ? const CircleAvatar()
                          : Container(
                              width: 40.w,
                              height: 40.h,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context
                                    .theme.colorScheme.onPrimaryContainer,
                              ),
                              child: AppImageWidget(
                                borderRadius: BorderRadius.circular(50),
                                imagePath: user.profilePicture ?? '',
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
