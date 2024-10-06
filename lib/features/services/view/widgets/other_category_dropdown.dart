import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class OtherCategoryDropdown extends ConsumerStatefulWidget {
  const OtherCategoryDropdown({super.key});

  @override
  ConsumerState<OtherCategoryDropdown> createState() =>
      _OtherCategoryDropdownState();
}

class _OtherCategoryDropdownState extends ConsumerState<OtherCategoryDropdown> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(servicesNotiferProvider).categories;
    return InkWell(
      onTap: () {
        isExpanded = !isExpanded;
        setState(() {});
      },
      child: AnimatedContainer(
        height: isExpanded ? 200.h : 71,
        width: context.width,
        clipBehavior: Clip.hardEdge,
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFE6E6EE),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppSvgWidget(
                    path: Assets.svgs.box,
                    color: const Color(0xFF77797D),
                  ),
                  10.horizontalSpace,
                  Text(context.l10n.otherListingCategory),
                  const Spacer(),
                  AnimatedRotation(
                    turns: isExpanded ? 0 : 0.5,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(CupertinoIcons.chevron_down),
                  ),
                ],
              ),
              if (categories.isNotEmpty && isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < categories.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(categories[i].name ?? ''),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
