import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.content,
    super.key,
    this.title,
    this.height,
    this.width,
    this.subtitle,
    this.onExitTap,
    this.cancelPadding,
    this.titleWidget,
    this.padding,
    this.hasHeaders = true,
    this.showButton,
    this.onButtonPressed,
  });
  final String? title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget content;
  final double? height;
  final double? width;
  final GestureTapCallback? onExitTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? cancelPadding;
  final bool hasHeaders;
  final bool? showButton;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ColorFilter.mode(
        Colors.black.withValues(alpha: 0.2),
        BlendMode.srcOver,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * .95,
          minHeight: 100,
          minWidth: width ?? MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        padding: padding ?? const EdgeInsets.all(20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? '',
                      style: context.theme.textTheme.bodySmall,
                    ),
                    10.horizontalSpace,
                    InkWell(
                      onTap: () => context.pop(),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                30.verticalSpace,
                Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: content,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
