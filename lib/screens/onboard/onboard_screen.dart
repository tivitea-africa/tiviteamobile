import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/utils/router.dart';
import 'package:tivi_tea/screens/auth/reguster/options_register.dart';
import 'package:tivi_tea/screens/auth/signIn_screen.dart';
import 'package:tivi_tea/screens/onboard/page_four.dart';
import 'package:tivi_tea/screens/onboard/page_one.dart';
import 'package:tivi_tea/screens/onboard/page_three.dart';
import 'package:tivi_tea/screens/onboard/page_two.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widget/reusbale_buttons.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({
    super.key,
  });

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  final PageController pageController = PageController(initialPage: 0);

  int activePage = 0;

  final List<Widget> pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
    const PageFour(),
  ];

  void nextPage() {
    if (activePage < pages.length - 1) {
      pageController.animateToPage(activePage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => OptionsRegisterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          itemCount: pages.length,
          controller: pageController,
          onPageChanged: (int page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (BuildContext context, index) {
            return pages[index % pages.length];
          },
        ),
        Positioned(
          right: 10.w,
          top: 115.h,
          child: GestureDetector(
            onTap: () => context.go('/optionToRegister'),
            child: Text('Skip',
                style: GoogleFonts.inter(
                    color: Color(0xff000000),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        Positioned(
          bottom: 90.h,
          left: 20.w,
          right: 20.w,
          child: FullButton(
            text: activePage == pages.length - 1 ? 'Get Started' : 'Next',
            height: 44,
            onPressed: nextPage,
            color: Colors.white,
            bgColor: AppColors.deepBlue,
          ),
        ),
        Positioned(
            bottom: 120.h,
            left: 0,
            right: 0,
            height: 50,
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                width: activePage == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: activePage == index
                                      ? AppColors.deepBlue
                                      : Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                ],
              ),
            )),
      ],
    ));
  }
}
