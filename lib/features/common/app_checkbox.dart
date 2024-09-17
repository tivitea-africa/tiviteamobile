import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';

class AppCheckbox extends StatefulWidget {
  final double width, height;
  final void Function(bool) onChanged;
  const AppCheckbox({
    super.key,
    this.height = 20,
    this.width = 20,
    required this.onChanged,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isChecked = !isChecked;
        setState(() {});

        widget.onChanged(isChecked);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isChecked ? context.theme.primaryColor : Colors.white,
          border: Border.all(color: const Color(0xFFD8D8DD)),
          borderRadius: BorderRadiusDirectional.circular(5),
        ),
        child: const Center(
          child: Icon(CupertinoIcons.check_mark, color: Colors.white, size: 15),
        ),
      ),
    );
  }
}
