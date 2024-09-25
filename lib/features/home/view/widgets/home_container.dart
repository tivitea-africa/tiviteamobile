import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class HomeViewContainer extends StatelessWidget {
  const HomeViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.w),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 180.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.findAll,
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFD6F0FC),
                  ),
                ),
                Text(
                  context.l10n.fromWorkTooks,
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Assets.images.homeContainerImage.image(
              fit: BoxFit.scaleDown,
              height: 120.h,
            ),
          ),
        ],
      ),
    );
  }
}
