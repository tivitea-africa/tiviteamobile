import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({
    required this.body,
    super.key,
    this.resizeToAvoidBottomInset,
    this.appbar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.footerButton,
    this.underFooterChild,
    this.bodyPadding,
    this.showActionButtons = (showBackButton: false, showSkip: false),
    this.onOnboardingActionTapped = (onBack: null, onSkip: null),
  });
  final Widget body;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appbar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? footerButton;
  final Widget? underFooterChild;
  final EdgeInsetsGeometry? bodyPadding;
  final ({bool showBackButton, bool showSkip}) showActionButtons;
  final ({
    VoidCallback? onBack,
    VoidCallback? onSkip
  }) onOnboardingActionTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(color: Colors.transparent),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: Stack(
            children: [
              Padding(
                padding: bodyPadding ?? EdgeInsets.symmetric(horizontal: 18.w),
                child: body,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Assets.images.scaffoldArc.image(),
                    _ItemRow(
                      showActionButtons: showActionButtons,
                      onOnboardingActionTapped: onOnboardingActionTapped,
                    )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final ({bool showBackButton, bool showSkip}) showActionButtons;
  final ({
    VoidCallback? onBack,
    VoidCallback? onSkip
  }) onOnboardingActionTapped;
  const _ItemRow({
    required this.showActionButtons,
    required this.onOnboardingActionTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showActionButtons.showBackButton)
            GestureDetector(
              onTap: onOnboardingActionTapped.onBack,
              child: AppSvgWidget(
                path: Assets.svgs.backButton,
                fit: BoxFit.scaleDown,
                width: 20.w,
                height: 20.h,
              ),
            ),
          if (showActionButtons.showSkip)
            GestureDetector(
              onTap: onOnboardingActionTapped.onSkip,
              child: Text(
                context.l10n.skip,
                style: context.theme.textTheme.titleSmall,
              ),
            ),
        ],
      ),
    );
  }
}
