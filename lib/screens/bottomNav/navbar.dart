import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/screens/bottomNav/bottom_nav.dart';
import 'package:tivi_tea/screens/home_section/home_screen.dart';
import 'package:tivi_tea/screens/services_section/service_screen.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({
    super.key,
  });

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  late List<Widget> pageList = const [
    HomeScreen(),
    ServiceScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  int pageIndex = 0;
  Color color = Colors.grey;
  void changePage(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: pageList[pageIndex],
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 65,
          elevation: 1,
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomNav(
                index: 0,
                onTap: () {
                  changePage(0);
                },
                icon: Iconsax.home,
                label: 'Home',
                color: pageIndex == 0 ? Colors.black : Colors.grey,
              ),
              BottomNav(
                index: 1,
                onTap: () {
                  changePage(1);
                },
                icon: Icons.person,
                label: 'Categories',
                color: pageIndex == 1 ? Colors.black : Colors.grey,
              ),
              // Gap(20),
              BottomNav(
                index: 2,
                onTap: () {
                  changePage(2);
                },
                icon: Iconsax.activity,
                label: 'Upload',
                color: pageIndex == 2 ? Colors.black : Colors.grey,
              ),
              BottomNav(
                index: 3,
                onTap: () {
                  changePage(3);
                },
                icon: Iconsax.user,
                label: 'Inbox',
                color: pageIndex == 3 ? Colors.black : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FabCont extends StatelessWidget {
  final Color? color;
  final String text;
  final IconData icon;

  const FabCont({
    super.key,
    this.color,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      width: 55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0), color: color),
            child: Center(
              child: Icon(icon, color: Colors.white, size: 16),
            ),
          ),
          const Gap(8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 9,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class BtmShtTile extends StatelessWidget {
  final String image;
  final String text;
  final String subText;
  final VoidCallback onPressed;

  const BtmShtTile(
      {super.key,
      required this.image,
      required this.text,
      required this.subText,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.black))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, height: 22.3, width: 22.3),
              const Gap(10),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      subText,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
