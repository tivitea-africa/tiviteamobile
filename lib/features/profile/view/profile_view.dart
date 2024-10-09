import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/profile/view/mixins/profile_item_mixin.dart';
import 'package:tivi_tea/features/profile/view/widgets/profile_appbar.dart';

class ProfileView extends ConsumerWidget with ProfileItemMixin {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileItems = getProfileItems(context: context, ref: ref);
    return AppScaffold(
      appbar: const ProfileAppBar(),
      body: Column(
        children: [
          100.verticalSpace,
          Expanded(
            child: ListView.builder(
              itemCount: profileItems.length,
              itemBuilder: (ctx, i) => Container(
                width: context.width,
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 20.w,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF969BA0)),
                  ),
                ),
                child: Row(
                  children: [
                    AppSvgWidget(path: profileItems[i].icon),
                    10.horizontalSpace,
                    Text(
                      profileItems[i].label,
                      style: context.theme.textTheme.displayLarge?.copyWith(
                        fontSize: 16.sp,
                        color: const Color(0xFF5C5C66),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
