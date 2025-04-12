import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';

class AppDropdown<T> extends ConsumerStatefulWidget {
  final List<T> items;
  final void Function(T) onItemSelected;
  const AppDropdown({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  ConsumerState<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends ConsumerState<AppDropdown> {
  String initialText = 'Select Option';
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isExpanded = !isExpanded;
        setState(() {});
      },
      child: AnimatedContainer(
        height: isExpanded ? 300.h : 70,
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
                  Text(initialText),
                  const Spacer(),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(CupertinoIcons.chevron_down),
                  ),
                ],
              ),
              if (widget.items.isNotEmpty && isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < widget.items.length; i++)
                        InkWell(
                          onTap: () {
                            widget.onItemSelected(widget.items[i]);

                            initialText = widget.items[i].toString();
                            isExpanded = false;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(widget.items[i].toString()),
                          ),
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
