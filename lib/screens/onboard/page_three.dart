import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:tivi_tea/core/const/app_assets.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/widget/reusbale_buttons.dart';
import 'package:tivi_tea/screens/auth/reguster/options_register.dart';
import 'package:tivi_tea/screens/onboard/widget/skip_text.dart';

import '../../core/widget/custom_clip_path.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff000050),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipPath(
          clipper: CustomClipperPath(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff000090), Color(0xff000050)])),
            height: 160,
          ),
        ),
        SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SkipText(),
              const Gap(43),
              Container(
                width: 250,
                height: 235,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      PlaceholderAssets.onbrd2,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(60),
              const Center(
                child: Text(
                  'Ready to Setup\nan Account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.deepBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(24),
              const Text(
                'Take the next 3 minutes to  setup your account and get started. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.fontColor,
                ),
              ),
              const Gap(40),
              FullButton(
                text: 'Get Started',
                width: double.infinity,
                height: 44,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const OptionsRegisterScreen(),
                    ),
                  );
                },
                color: Colors.white,
                bgColor: AppColors.deepBlue,
              ),
              const Gap(12),
            ],
          ),
        )
      ],
    );
  }
}
