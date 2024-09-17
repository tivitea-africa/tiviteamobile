import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';

class SlideIndicatorWidget extends StatelessWidget {
  final int slideLength;
  final int currentIndex;
  final Color? color;
  final Color? unselectedColor;
  const SlideIndicatorWidget({
    super.key,
    required this.slideLength,
    required this.currentIndex,
    this.color,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < slideLength; i++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: _Indicator(
              isCurrentIndex: i == currentIndex,
              color: color,
              unselectedColor: unselectedColor,
            ),
          ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final bool isCurrentIndex;
  final Color? color;
  final Color? unselectedColor;
  const _Indicator({
    this.isCurrentIndex = false,
    this.color,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: 12.w,
      height: 12.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isCurrentIndex
            ? color ?? theme.primaryColor
            : unselectedColor ?? theme.cardColor,
      ),
    );
  }
}
