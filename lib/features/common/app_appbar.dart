import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_navbar.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/customizable_row.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.homeScreenAppBar = false,
    this.showBackButton = true,
    this.showBackButtonForHomeScreenAppBar = false,
    this.title,
    this.userName,
    this.onTap,
    this.onHomeBackButtonTap,
    this.color,
    this.padding,
    super.key,
  });
  final bool homeScreenAppBar;
  final bool showBackButton;
  final bool showBackButtonForHomeScreenAppBar;
  final VoidCallback? onHomeBackButtonTap;
  final String? title;
  final String? userName;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: padding ??
          EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 18.w,
            right: 18.w,
            bottom: 10.h,
          ),
      decoration: const BoxDecoration(color: Colors.white),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          if (homeScreenAppBar) ...[
            Builder(
              builder: (context) {
                return InkWell(
                  onTap: () => showBackButtonForHomeScreenAppBar
                      ? onHomeBackButtonTap != null
                          ? onHomeBackButtonTap!()
                          : null
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
            const CircleAvatar(),
          ] else ...[
            Expanded(
              child: CustomizableRow(
                flexValues: const [1, 4, 1],
                children: [
                  switch (showBackButton) {
                    true => AppSvgWidget(
                        path: Assets.svgs.chevronLeft,
                        onTap: onTap ?? () => context.pop(),
                      ),
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
                      const CircleAvatar(),
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
