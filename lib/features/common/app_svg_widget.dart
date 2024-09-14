import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgWidget extends StatelessWidget {
  const AppSvgWidget({
    required this.path,
    this.color,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.onTap,
    super.key,
  });
  final String path;
  final Color? color;
  final BoxFit fit;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        path,
        fit: fit,
        width: width,
        height: height,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      ),
    );
  }
}