import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  const AppButton({
    super.key,
    this.onPressed,
    this.buttonText,
    this.textColor,
    this.textStyle,
    this.borderColor,
    this.backgroundColor,
    this.prefixIcon,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isLoading ? null : double.infinity,
      child: ElevatedButton(
        onPressed: (isEnabled && (isLoading == false)) ? onPressed : null,
        style: ButtonStyle(
          side: WidgetStatePropertyAll<BorderSide>(
            BorderSide(
              color: !isEnabled
                  ? const Color(0xFFD8D8DD)
                  : borderColor ?? Colors.transparent,
            ),
          ),
          backgroundColor: !isEnabled
              ? const WidgetStatePropertyAll<Color>(Colors.transparent)
              : backgroundColor == null
                  ? null
                  : WidgetStatePropertyAll<Color>(backgroundColor!),
          foregroundColor: !isEnabled
              ? const WidgetStatePropertyAll<Color>(Color(0xFFD8D8DD))
              : textColor == null
                  ? null
                  : WidgetStatePropertyAll<Color>(textColor!),
        ),
        child: switch (isLoading) {
          true => const CupertinoActivityIndicator(color: Colors.white),
          _ => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null) prefixIcon!,
                Text(
                  buttonText ?? context.l10n.next,
                  style: textStyle,
                ),
              ],
            ),
        },
      ),
    );
  }
}
