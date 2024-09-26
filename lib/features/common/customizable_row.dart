import 'package:flutter/material.dart';

class CustomizableRow extends StatelessWidget {
  const CustomizableRow({
    this.padding,
    this.numberOfChildren,
    this.flexValues,
    this.children,
    super.key,
  });
  final EdgeInsetsGeometry? padding;
  final int? numberOfChildren;
  final List<int>? flexValues;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    assert(
      () {
        if (numberOfChildren != null && flexValues != null) {
          return numberOfChildren == flexValues!.length;
        }
        return true;
      }(),
      'Number of children must be equal to flexValues',
    );
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: List.generate(
          flexValues?.length ?? numberOfChildren ?? 1,
          (index) => Expanded(
            flex: flexValues?[index] ?? 1,
            child: children?[index] ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
