import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/features/common/app_navbar.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.homeScreenAppBar = false,
    this.showBackButton = true,
    this.title,
    this.userName,
    this.onTap,
    this.color,
    super.key,
  });
  final bool homeScreenAppBar;
  final bool showBackButton;
  final String? title;
  final String? userName;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 20.w,
        right: 20.w,
        bottom: 10.h,
      ),
      decoration: const BoxDecoration(color: Colors.white),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Builder(
            builder: (context) {
              return InkWell(
                onTap: () => scaffoldKey.currentState?.openDrawer(),
                child: AppSvgWidget(path: Assets.svgs.hamburger),
              );
            }
          ),
          const Spacer(),
          AppSvgWidget(path: Assets.svgs.notificationIcon),
          10.horizontalSpace,
          const CircleAvatar(),
        ],
      ),
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
