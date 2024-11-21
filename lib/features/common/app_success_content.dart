import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class AppSuccessContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String? secondButtonText;
  final VoidCallback? onPressed;
  final VoidCallback? onSecondButtonPressed;
  const AppSuccessContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.secondButtonText,
    this.onPressed,
    this.onSecondButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSvgWidget(path: Assets.svgs.greenCheck),
        10.verticalSpace,
        Text(title, style: context.theme.textTheme.titleSmall),
        20.verticalSpace,
        Text(
          subtitle,
          style: context.theme.textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        30.verticalSpace,
        AppButton(
          buttonText: buttonText,
          onPressed: onPressed,
        ),
        if (secondButtonText != null)
          AppButton(
            buttonText: secondButtonText,
            onPressed: onSecondButtonPressed,
            backgroundColor: Colors.transparent,
            textColor: context.theme.primaryColor,
          )
      ],
    );
  }
}
