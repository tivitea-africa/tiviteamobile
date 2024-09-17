import 'package:flutter/material.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class AppSuccessContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onPressed;
  const AppSuccessContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSvgWidget(path: Assets.svgs.greenCheck),
        Text(title, style: context.theme.textTheme.titleSmall),
        Text(subtitle, style: context.theme.textTheme.displaySmall),
        AppButton(buttonText: buttonText, onPressed: onPressed,)
      ],
    );
  }
}
