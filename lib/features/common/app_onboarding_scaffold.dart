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
    this.extendBody = false,
    this.showSkip = false,
  });
  final Widget body;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appbar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? footerButton;
  final Widget? underFooterChild;
  final EdgeInsetsGeometry? bodyPadding;
  final bool extendBody;
  final bool showSkip;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(color: Colors.transparent),
        ),
        child: Scaffold(
          //appBar: appbar ?? const LuraAppBar(),
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
                    _ItemRow(showSkip: showSkip)
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          // persistentFooterButtons: (footerButton != null)
          //     ? [
          //         Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
          //           child: Container(
          //             margin: context.bottomPaddingForTextField,
          //             child: Column(
          //               children: [
          //                 footerButton!,
          //                 10.verticalSpace,
          //                 if (underFooterChild != null) underFooterChild!
          //               ],
          //             ),
          //           ),
          //         ),
          //       ]
          //     : null,
          extendBody: extendBody,
        ),
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final bool showSkip;
  const _ItemRow({this.showSkip = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppSvgWidget(
            path: Assets.svgs.backButton,
            fit: BoxFit.scaleDown,
            width: 20.w,
            height: 20.h,
            color: Colors.red,
          ),
          Text(
            context.l10n.skip,
            style: context.theme.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
