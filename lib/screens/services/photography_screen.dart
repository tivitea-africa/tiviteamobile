import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/widget/category_custom_card.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';
import 'package:tivi_tea/screens/profile/favourites_screen.dart';

import '../../core/const/app_colors.dart';

class PhotographyCategoryScreen extends StatefulWidget {
  const PhotographyCategoryScreen({super.key});

  @override
  State<PhotographyCategoryScreen> createState() =>
      _PhotographyCategoryScreenState();
}

class _PhotographyCategoryScreenState extends State<PhotographyCategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(Icons.chevron_left),
          onTap: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'Photography',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xff000050)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FavouritesScreen()));
            },
            icon: const Icon(
              Iconsax.notification,
              color: AppColors.deepBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.element_4,
              color: AppColors.deepBlue,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: buildTextField('Search', null, 30, 44,
                      Colors.grey.shade100, BorderSide.none, false,
                      prefixIcon: Icons.search_outlined),
                ),
                const Gap(30),
                Container(
                  height: 44,
                  width: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: const Color(0xFF000050),
                      width: 0.1,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Iconsax.filter, size: 16),
                      Gap(6),
                      Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.fontColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Gap(10),
            TabBar(
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 12),
              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              controller: tabController,
              tabs: const [
                Tab(text: 'Co-Working Space'),
                Tab(text: 'Photography'),
                Tab(text: 'Fashion'),
                Tab(text: 'Tech'),
              ],
            ),
            const Gap(20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Showing 1 - 10 ',
                      style: GoogleFonts.poppins(
                          fontSize: 12.63,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff0E0E1B))),
                  TextSpan(
                    text: ' out of 50 Results',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.63,
                        color: const Color(0xff737380)),
                  ),
                ],
              ),
            ),
            const Gap(24),
            CategoryCustomCard(
                color: Colors.greenAccent.shade100,
                image: PlaceholderAssets.image2,
                title: 'Canon EOS 60D',
                status: 'Available',
                icon: Icons.bolt_outlined,
                statusColor: Colors.green),
            CategoryCustomCard(
              color: Colors.greenAccent.shade100,
              image: PlaceholderAssets.image3,
              title: 'Sony A3 Mirror',
              status: 'Available',
              icon: Icons.bolt_outlined,
              statusColor: Colors.green,
            ),
            CategoryCustomCard(
                color: Colors.orangeAccent.shade100,
                image: PlaceholderAssets.image2,
                title: 'Samsung F23',
                status: 'Blocked',
                icon: Icons.pause,
                statusColor: Colors.deepOrange),
            CategoryCustomCard(
              color: Colors.greenAccent.shade100,
              image: PlaceholderAssets.image3,
              title: 'Canon EOS 60D',
              status: 'Available',
              icon: Icons.bolt_outlined,
              statusColor: Colors.green,
            ),
            CategoryCustomCard(
              color: Colors.orangeAccent.shade100,
              image: PlaceholderAssets.image2,
              title: 'Samsung F23',
              status: 'Blocked',
              icon: Icons.pause,
              statusColor: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}
