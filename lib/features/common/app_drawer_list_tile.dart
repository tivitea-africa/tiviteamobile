import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';

class DrawerListTile extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final bool logOutButton;
  final VoidCallback? onTap;
  const DrawerListTile({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.logOutButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200.w,
        margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? context.theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            children: [
              AppSvgWidget(
                path: icon,
                color: logOutButton
                    ? null
                    : isSelected
                        ? Colors.white
                        : const Color(0xFF5C5C66),
              ),
              10.horizontalSpace,
              Text(
                label,
                style: context.theme.textTheme.titleSmall?.copyWith(
                  color: logOutButton
                      ? AppColors.danger
                      : isSelected
                          ? Colors.white
                          : const Color(0xFF5C5C66),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
