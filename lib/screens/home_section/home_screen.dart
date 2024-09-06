import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/container_sample.dart';
import 'package:tivi_tea/core/widget/custom_app_bar.dart';
import 'package:tivi_tea/core/widget/options_tab.dart';
import 'package:tivi_tea/core/widget/reusbale_containers.dart';
import 'package:tivi_tea/screens/home_section/pages/view_all_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        leading: const Drawer(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          child: Icon(Icons.reorder),
        ),
        title: '',
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(right: 13, top: 24, bottom: 24, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back!',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    color: Color(0xff000050))),
            Gap(4),
            Text('Hi richard, welcome back to tiviTea admin!',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff737380))),
            const Gap(17),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40.h,
                width: 73.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.transparent,
                    border: Border.all(color: const Color(0xFF000050))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Iconsax.filter),
                    Gap(6),
                    Text('Filters',
                        style: GoogleFonts.poppins(
                            color: Color(0xff5C5C66),
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
            const Gap(10),
            const CustomPageView(),
            const Gap(24),
            Row(
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepBlue,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            const OptionsSelector(),
            const Gap(24),
            SizedBox(
              height: 271,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewAll(),
                          ),
                        );
                      },
                      child: const FashionCard());
                },
              ),
            ),
            const Gap(45),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Most Popular',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepBlue,
                ),
              ),
            ),
            const Gap(24),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CustomCard();
              },
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}
