import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      //initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            label: context.l10n.home,
            icon: AppSvgWidget(path: Assets.svgs.homeNavBarIcon),
          ),
          NavigationDestination(
            label: context.l10n.services,
            icon: AppSvgWidget(path: Assets.svgs.servicesNavBarIcon),
          ),
          NavigationDestination(
            label: context.l10n.myHistory,
            icon: AppSvgWidget(path: Assets.svgs.historyNavBarIcon),
          ),
          NavigationDestination(
            label: context.l10n.profile,
            icon: AppSvgWidget(path: Assets.svgs.profileNavBarIcon),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
