import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.padding = const SizedBox(height: 24.0),
    this.onTap,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.halfLabel,
  });
  final String? hintText;
  final TextEditingController? controller;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? label;
  final String? halfLabel;
  final Widget padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              TextFormField(
                onTap: onTap,
                textAlign: TextAlign.left,
                style: context.theme.textTheme.displaySmall,
                cursorColor: Colors.black,
                controller: controller,
                decoration: InputDecoration(
                  counterText: "",
                  alignLabelWithHint: false,
                  filled: true,
                  fillColor: context.theme.dividerColor,
                  prefixIcon: AppSvgWidget(
                    path: Assets.svgs.search,
                    color: const Color(0xFF8A8A99),
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: suffixIcon,
                  enabled: true,
                  hintText: hintText,
                  hintStyle: context.theme.textTheme.displaySmall?.copyWith(
                    color: const Color(0xFF8A8A99),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: context.theme.dividerColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: context.theme.dividerColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: context.theme.dividerColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FiltersWidget extends StatelessWidget {
  final bool hasBackGroundFill;
  const FiltersWidget({
    super.key,
    this.hasBackGroundFill = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 40.h,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: hasBackGroundFill ? context.theme.dividerColor : null,
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          width: 0.5,
          color: context.theme.primaryColor.withOpacity(0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSvgWidget(path: Assets.svgs.filterIcon),
          5.horizontalSpace,
          Text(context.l10n.filters,
              style: context.theme.textTheme.displaySmall),
        ],
      ),
    );
  }
}
