import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/string_extensions.dart';

class CustomDropdown extends ConsumerStatefulWidget {
  final void Function(String) onOptionSelected;
  final List<String> items;
  const CustomDropdown({
    super.key,
    required this.onOptionSelected,
    required this.items,
  });

  @override
  ConsumerState<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends ConsumerState<CustomDropdown> {
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
        height: isExpanded ? 140.h : 71,
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
                  Text(initialText),
                  const Spacer(),
                  AnimatedRotation(
                    turns: isExpanded ? 0 : 0.5,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            onTap: () {
                              widget.onOptionSelected(widget.items[i]);

                              initialText = widget.items[i].capiTalizeFirst;
                              isExpanded = false;
                              setState(() {});
                            },
                            child: Text(widget.items[i]),
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
