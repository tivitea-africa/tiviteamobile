import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class RegistrationAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const RegistrationAppBar({
    this.homeScreenAppBar = false,
    this.showBackButton = true,
    this.headerSectionSubtitle,
    this.headerSectionTitle,
    this.title,
    this.userName,
    this.onTap,
    this.color,
    super.key,
  });
  final bool homeScreenAppBar;
  final bool showBackButton;
  final String? title;
  final String? headerSectionTitle;
  final String? headerSectionSubtitle;
  final String? userName;
  final Color? color;
  final VoidCallback? onTap;

  static double appBarHeight = 160.h;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 18.w,
        right: 18.w,
        bottom: 20.h,
      ),
      decoration: const BoxDecoration(color: Colors.transparent),
      width: context.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onTap ?? () => context.pop(),
                child: const Icon(CupertinoIcons.chevron_left),
              ),
              AppSvgWidget(path: Assets.svgs.hamburger)
            ],
          ),
          10.verticalSpace,
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.sectionHeader.path),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headerSectionTitle ?? context.l10n.buyerOrCustomer,
                  style: context.theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  headerSectionSubtitle ?? context.l10n.newTo,
                  style: context.theme.textTheme.displaySmall
                      ?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //static final _appBar = AppBar();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
