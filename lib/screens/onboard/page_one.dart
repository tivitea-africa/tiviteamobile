import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/custom_clip_path.dart';
import 'package:tivi_tea/main.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: CustomClipperPath(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff000090), Color(0xff000050)])),
            height: 120.h,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/placeholders/o4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Center(
                child: Text(
                  'Welcome to tiviTea',
                  style: GoogleFonts.dmSans(
                      fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),
              ),
              const Gap(20),
              Text(
                  'Discover the perfect workspace/tool to boost your productivity. Let,s get you set up!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 16.sp, fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ],
    );
  }
}
