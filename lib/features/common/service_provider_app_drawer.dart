import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/common/app_drawer_list_tile.dart';
import 'package:tivi_tea/features/login/view_model/login_notifier.dart';
import 'package:tivi_tea/features/login/view_model/login_state.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ServiceProviderAppDrawer extends ConsumerWidget {
  const ServiceProviderAppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appAccessState = ref.watch(loginNotifierProvider).appAccessState;
    final isGuest = appAccessState == AppAccessState.guest;
    final routePath = GoRouterState.of(context).matchedLocation;
    const dashboard =
        '${AppRoutes.homeView}${AppRoutes.serviceProviderDashboard}';
    const settings = '${AppRoutes.profile}/${AppRoutes.settingsView}';
    const bookingHistory =
        '${AppRoutes.homeView}${AppRoutes.bookingHistoryView}';
    const payment = '${AppRoutes.profile}/${AppRoutes.paymentView}';
    const withdrawals = '${AppRoutes.profile}/${AppRoutes.withdrawalView}';
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.verticalSpace,
          Center(
            child: Assets.images.appLogoBlue.image(
              fit: BoxFit.scaleDown,
              width: 63.w,
              height: 43.h,
            ),
          ),
          20.verticalSpace,
          if (appAccessState != AppAccessState.guest)
            DrawerListTile(
              icon: Assets.svgs.dashboardDrawerIcon,
              label: context.l10n.dashboard,
              isSelected: routePath == dashboard,
              onTap: () {
                if (routePath == dashboard) {
                  context.go(AppRoutes.homeView);
                  return;
                }
                context.go(dashboard);
              },
            ),
          if (appAccessState != AppAccessState.guest)
            DrawerListTile(
              icon: Assets.svgs.profileDrawerIcon,
              label: context.l10n.profile,
              isSelected: routePath == AppRoutes.profile,
              onTap: () => context.go(AppRoutes.profile),
            ),
          if (appAccessState != AppAccessState.guest)
            DrawerListTile(
              icon: Assets.svgs.listingDrawerIcon,
              label: context.l10n.myListing,
              isSelected: routePath == AppRoutes.myListingView,
              onTap: () => context.go(AppRoutes.myListingView),
            ),
          if (appAccessState != AppAccessState.guest)
            DrawerListTile(
              icon: Assets.svgs.historyDrawerIcon,
              label: context.l10n.bookingHistory,
              isSelected: routePath == bookingHistory,
              onTap: () => context.go(bookingHistory),
            ),
          if (appAccessState != AppAccessState.guest)
            DrawerListTile(
              icon: Assets.svgs.paymentDrawerIcon,
              label: context.l10n.payments,
              isSelected: routePath == payment,
              onTap: () => context.go(payment),
            ),
          if (appAccessState != AppAccessState.guest)
            DrawerListTile(
              icon: Assets.svgs.paymentDrawerIcon,
              label: 'Withdrawals',
              isSelected: routePath == withdrawals,
              onTap: () => context.go(withdrawals),
            ),
          // DrawerListTile(
          //   icon: Assets.svgs.activitiesDrawerIcon,
          //   label: context.l10n.activities,
          // ),
          // DrawerListTile(
          //   icon: Assets.svgs.messagesDrawerIcon,
          //   label: context.l10n.messages,
          // ),
          // DrawerListTile(
          //   icon: Assets.svgs.soldiersDrawerIcon,
          //   label: context.l10n.addFootSoldiers,
          // ),
          // DrawerListTile(
          //   icon: Assets.svgs.settingsDrawerIcon,
          //   label: context.l10n.customerReview,
          // ),
          Padding(
            padding: EdgeInsets.only(left: isGuest ? 0 : 10.w),
            child: Column(
              children: [
                DrawerListTile(
                  icon: Assets.svgs.headphonesDrawerIcon,
                  label: context.l10n.customerSupport,
                ),
                if (appAccessState != AppAccessState.guest)
                  DrawerListTile(
                    icon: Assets.svgs.settingsDrawerIcon,
                    label: context.l10n.settings,
                    isSelected: routePath == settings,
                    onTap: () => context.go(settings),
                  ),
                if (appAccessState != AppAccessState.guest)
                  DrawerListTile(
                    icon: Assets.svgs.report,
                    label: context.l10n.report,
                  ),
                20.verticalSpace,
                Consumer(
                  builder: (context, ref, _) {
                    final notifier = ref.read(loginNotifierProvider.notifier);
                    return DrawerListTile(
                      icon: Assets.svgs.logout,
                      label: isGuest ? 'Login' : context.l10n.logOut,
                      logOutButton: isGuest ? false : true,
                      onTap: () {
                        if (isGuest) {
                          _navigateToLogin(context);
                          return;
                        }
                        notifier.logout(
                          onDataCleared: () => _navigateToLogin(context),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _navigateToLogin(BuildContext context) {
    context.pushReplacement(AppRoutes.loginView);
  }
}
