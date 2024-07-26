import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/screens/customer/dashboard/dashboard_screen.dart';
import 'package:tivi_tea/screens/customer/history/history_screen.dart';
import 'package:tivi_tea/screens/customer/profile/profile_screen.dart';
import 'package:tivi_tea/screens/profile/favourites_screen.dart';

class CustomerSidebarMenu extends StatelessWidget {
  const CustomerSidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Gap(32),
          Image.asset(
            ImageAssets.logo, // Add your logo asset here
            height: 43,
            width: 63.3,
          ),
          const Gap(32),
          _createDrawerItem(
            icon: Icons.pie_chart_outline,
            text: 'Dashboard',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomerDashboardScreen(),
                ),
              );
              // Navigate to the Dashboard screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.person_outline,
            text: 'My Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
              // Navigate to the My Profile screen or perform an action ServiceProfileScreen
            },
          ),
          _createDrawerItem(
            icon: Icons.star_outlined,
            text: 'My Favourites',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouritesScreen(),
                ),
              );
              // Navigate to the My favourite screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.history,
            text: 'Booking history',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomerHistoryScreen(),
                ),
              );
              // Navigate to the Booking history screen or perform an action HistoryScreen
            },
          ),
          _createDrawerItem(
            icon: Icons.payment,
            text: 'Payments',
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Payments screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.local_activity_outlined,
            text: 'Activities',
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Activities screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.analytics,
            text: 'Analytics',
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Analytics screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.message_outlined,
            text: 'Messages',
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Messages screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.reviews_outlined,
            text: 'Customer Review',
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Customer Review screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.support_outlined,
            text: 'Customer support',
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Customer support screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.settings_outlined,
            text: 'Settings',
            onTap: () {
              Navigator.pop(context);
              // Navigate to the Settings screen or perform an action
            },
          ),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Log Out',
            onTap: () {
              Navigator.pop(context);
              // Handle the logout action
            },
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap,
      Color textColor = AppColors.deepBlue}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: textColor),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text, style: TextStyle(color: textColor)),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
