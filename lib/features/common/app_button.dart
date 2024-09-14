import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final bool isLoading;
  const AppButton({
    super.key,
    this.onPressed,
    this.buttonText,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isLoading ? null : double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: switch (isLoading) {
          true => const CupertinoActivityIndicator(),
          _ => Text(buttonText ?? context.l10n.next),
        },
      ),
    );
  }
}
