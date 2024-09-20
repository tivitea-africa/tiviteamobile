import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/features/common/app_drawer_list_tile.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ServiceProviderAppDrawer extends StatelessWidget {
  const ServiceProviderAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          DrawerListTile(
            icon: Assets.svgs.dashboardDrawerIcon,
            label: context.l10n.dashboard,
            isSelected: true,
          ),
          DrawerListTile(
            icon: Assets.svgs.profileDrawerIcon,
            label: context.l10n.profile,
          ),
          DrawerListTile(
            icon: Assets.svgs.listingDrawerIcon,
            label: context.l10n.myListing,
          ),
          DrawerListTile(
            icon: Assets.svgs.historyDrawerIcon,
            label: context.l10n.bookingHistory,
          ),
          DrawerListTile(
            icon: Assets.svgs.paymentDrawerIcon,
            label: context.l10n.payments,
          ),
          DrawerListTile(
            icon: Assets.svgs.activitiesDrawerIcon,
            label: context.l10n.activities,
          ),
          DrawerListTile(
            icon: Assets.svgs.messagesDrawerIcon,
            label: context.l10n.messages,
          ),
          DrawerListTile(
            icon: Assets.svgs.soldiersDrawerIcon,
            label: context.l10n.addFootSoldiers,
          ),
          DrawerListTile(
            icon: Assets.svgs.settingsDrawerIcon,
            label: context.l10n.customerReview,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              children: [
                DrawerListTile(
                  icon: Assets.svgs.headphonesDrawerIcon,
                  label: context.l10n.customerSupport,
                ),
                DrawerListTile(
                  icon: Assets.svgs.settingsDrawerIcon,
                  label: context.l10n.settings,
                ),
                DrawerListTile(
                  icon: Assets.svgs.report,
                  label: context.l10n.report,
                ),
                20.verticalSpace,
                DrawerListTile(
                  icon: Assets.svgs.logout,
                  label: context.l10n.logOut,
                  logOutButton: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}