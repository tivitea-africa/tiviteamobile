import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class Navbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const Navbar({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('NavbarWithNestedNavigation'));

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                );
              } else {
                return GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF737380),
                );
              }
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          backgroundColor: context.theme.primaryColor,
          height: 80.h,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            NavigationDestination(
              label: context.l10n.home,
              icon: AppSvgWidget(
                path: Assets.svgs.homeNavBarIcon,
                color: const Color(0xFF737380),
              ),
              selectedIcon: AppSvgWidget(path: Assets.svgs.homeNavBarIcon),
            ),
            NavigationDestination(
              label: context.l10n.services,
              icon: AppSvgWidget(path: Assets.svgs.servicesNavBarIcon),
              selectedIcon: AppSvgWidget(
                path: Assets.svgs.servicesNavBarIcon,
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              label: context.l10n.myHistory,
              icon: AppSvgWidget(path: Assets.svgs.historyNavBarIcon),
              selectedIcon: AppSvgWidget(
                path: Assets.svgs.historyNavBarIcon,
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              label: context.l10n.profile,
              icon: AppSvgWidget(path: Assets.svgs.profileNavBarIcon),
              selectedIcon: AppSvgWidget(
                path: Assets.svgs.profileNavBarIcon,
                color: Colors.white,
              ),
            ),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}
