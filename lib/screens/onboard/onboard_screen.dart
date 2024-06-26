import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/screens/onboard/page_one.dart';
import 'package:tivi_tea/screens/onboard/page_three.dart';
import 'package:tivi_tea/screens/onboard/page_two.dart';

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
    const PageThree()
  ];

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
            bottom: 0,
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
                      itemCount: 3,
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ],
    ));
  }
}
