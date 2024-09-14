import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_onboarding_scaffold.dart';
import 'package:tivi_tea/features/onboarding/presentation/widgets/slide_indicator.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({
    super.key,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;
  final PageController _controller = PageController();
  final List<String> imagePaths = [
    Assets.images.onboardingSlide1.path,
    Assets.images.onboardingSlide2.path,
    Assets.images.onboardingSlide3.path,
    Assets.images.onboardingSlide4.path,
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(indicatorListener);
  }

  void indicatorListener() {
    final newPage = _controller.page?.round() ?? 0;
    if (newPage != currentIndex) {
      setState(() {
        currentIndex = newPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          30.verticalSpace,
          SizedBox(
            height: context.height / 1.5,
            child: PageView.builder(
              controller: _controller,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                final image = imagePaths[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      _getTitleText(context, index),
                      textAlign: TextAlign.center,
                      style: context.theme.textTheme.titleMedium,
                    ),
                    20.verticalSpace,
                    Text(
                      _getSubtitleText(context, index),
                      textAlign: TextAlign.center,
                      style: context.theme.textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ),
          AnimatedScale(
            scale: currentIndex == (imagePaths.length - 1) ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SlideIndicatorWidget(
              currentIndex: currentIndex,
              slideLength: imagePaths.length - 1,
            ),
          ),
          50.verticalSpace,
          AppButton(
            buttonText: currentIndex == (imagePaths.length - 1)
                ? context.l10n.getStarted
                : null,
          ),
        ],
      ),
    );
  }

  String _getTitleText(BuildContext context, int slideIndex) {
    switch (slideIndex) {
      case 0:
        return context.l10n.welcomeToTiviTea;
      case 1:
        return context.l10n.exploreFeatures;
      case 2:
        return context.l10n.bookWorkspace;
      default:
        return context.l10n.readyToSetUpAccount;
    }
  }

  String _getSubtitleText(BuildContext context, int slideIndex) {
    switch (slideIndex) {
      case 0:
        return context.l10n.discoverWorkSpace;
      case 1:
        return context.l10n.findWorkspaceOrtool;
      case 2:
        return context.l10n.findAndBook;
      default:
        return context.l10n.takeNext3Minutes;
    }
  }
}
