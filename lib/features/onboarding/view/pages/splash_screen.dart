import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/onboarding/view_model/onboarding_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        final isUserRemembered = ref.read(getRememberUserStatusProvider);
        if (isUserRemembered) {
          context.pushReplacement(AppRoutes.homeView);
          return;
        }

        ///TODO: Check user states here and decide screne to navigate to
        context.push(AppRoutes.loginView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: context.width,
        height: context.height,
        color: context.theme.primaryColor,
        child: Center(
          child: Assets.images.appLogo.image(
            fit: BoxFit.scaleDown,
            height: 100.h,
            width: 150.w,
          ),
        ),
      ),
    );
  }
}
