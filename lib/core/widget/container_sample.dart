import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/reusable_textfield.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "title": "Find all you need",
      "subtitle": "From work tools to\nco-working space.",
      "imagePath": PlaceholderAssets.onbrd1,
    },
    {
      "title": "Work anywhere",
      "subtitle": "Where Ever\nBusiness Take You.",
      "imagePath": PlaceholderAssets.home1,
    },
    {
      "title": "Make the right connection",
      "subtitle": "Connect To The Right\nPeople For Business",
      "imagePath": PlaceholderAssets.home2,
    },
  ];

  final List<Color> pageColors = [
    AppColors.deepBlue, // Color for the first page
    AppColors.goldOrng, // Color for the second page
    AppColors.deepBlue, // Color for the third page
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 104.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return CustomBanner(
                title: pages[index]["title"]!,
                subtitle: pages[index]["subtitle"]!,
                imagePath: pages[index]["imagePath"]!,
                color: pageColors[index],
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pages.length,
            (index) => IndicatorDot(isActive: index == _currentIndex),
          ),
        ),
      ],
    );
  }
}

class CustomBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color color;

  const CustomBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const Gap(2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 96,
            width: 91,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.deepBlue : const Color(0xFFAAAAC5),
        shape: BoxShape.circle,
      ),
    );
  }
}
