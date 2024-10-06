import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({
    required this.child,
    this.horizontalPadding = 24,
    this.verticalPadding = 58,
    super.key,
  });

  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  State<AppDialog> createState() => _MessageDialogState();
}

class _MessageDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding.w,
          vertical: widget.verticalPadding.h,
        ),
        child: IntrinsicHeight(child: widget.child),
      ),
    );
  }
}
