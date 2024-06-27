import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/container_sample.dart';
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
      appBar: AppBar(
        leading: const Row(
          children: [
            Gap(8),
            CircleAvatar(
              radius: 22.5,
              backgroundImage: AssetImage(
                PlaceholderAssets.pfp,
              ),
            ),
          ],
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.deepBlue,
              ),
            ),
            Text(
              'Richard Steinberg',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.fontColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
        child: Column(
          children: [
            SizedBox(
              height: 44,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: const Color(0xFFE8E8EB),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            color: Color(0xFF8A8A99),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),

                          border: InputBorder.none, // Remove the underline
                          enabledBorder: InputBorder
                              .none, // Remove the underline for enabled state
                          focusedBorder: InputBorder.none,
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Color(0xFF8A8A99),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(11),
                  Container(
                    height: 44,
                    width: 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xFFE8E8EB),
                      border: Border.all(
                        color: const Color(0xFF000050),
                        width: 0.5,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Iconsax.filter),
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
            ),
            const Gap(24),
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
                            builder: (context) => ViewAll(),
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
