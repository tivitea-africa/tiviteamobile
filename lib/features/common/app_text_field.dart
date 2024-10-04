import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.textStyle,
    this.width,
    this.labelSpace = 10,
    this.textCapitalization = TextCapitalization.none,
    this.padding = const SizedBox(height: 24.0),
    this.onTap,
    this.decoration,
    this.hintStyle,
    this.backgroundColor,
    this.isLoading = false,
    this.readOnly = false,
    this.customLabel,
    this.hintText,
    this.controller,
    this.minLines = 1,
    this.obscureText = false,
    this.showCursor = true,
    this.enabled = true,
    this.fillTextField = true,
    this.validateFunction,
    this.borderSide = BorderSide.none,
    this.onSaved,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.enableErrorMessage = true,
    this.maxLines = 1,
    this.maxLength,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.autofocus,
    this.label,
    this.halfLabelColor,
    this.halfLabel,
    this.inputFormatters,
    this.borderRadius = 8,
    this.initialValue,
    this.labelSize,
    this.labelColor,
  });
  final double? width;
  final double? labelSize;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool? enabled;
  final bool? fillTextField;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? halfLabelColor;
  final bool? autofocus;
  final String? label;
  final String? halfLabel;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading;
  final bool readOnly;
  final bool showCursor;
  final double borderRadius;
  final double labelSpace;
  final String? initialValue;
  final Widget? customLabel;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide borderSide;
  final Widget padding;
  final TextCapitalization textCapitalization;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.customLabel != null) widget.customLabel!,
        if (widget.customLabel == null && widget.label != null)
          Text(
            widget.label!,
            style: context.theme.textTheme.labelMedium,
          ),
        if (widget.customLabel != null || widget.label != null)
          SizedBox(height: widget.labelSpace),
        Stack(
          clipBehavior: Clip.none,
          children: [
            TextFormField(
              showCursor: widget.showCursor,
              maxLength: widget.maxLength,
              textCapitalization: widget.textCapitalization,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              initialValue: widget.initialValue,
              textAlign: TextAlign.left,
              inputFormatters: widget.inputFormatters,
              autofocus: widget.autofocus ?? false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: widget.enabled,
              validator: widget.validateFunction != null
                  ? widget.validateFunction!
                  : (value) {
                      return null;
                    },
              onSaved: (val) {
                error = widget.validateFunction!(val);
                setState(() {});
                widget.onSaved!(val!);
              },
              onChanged: (val) {
                widget.validateFunction != null
                    ? error = widget.validateFunction!(val)
                    : error = null;
                setState(() {});
                if (widget.onChange != null) widget.onChange!.call(val);
              },
              style: widget.textStyle ?? context.theme.textTheme.displaySmall,
              cursorColor: Colors.black,
              key: widget.key,
              maxLines: widget.maxLines,
              controller: widget.controller,
              obscureText: widget.obscureText!,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              focusNode: widget.focusNode,
              onFieldSubmitted: widget.onFieldSubmitted,
              decoration: widget.decoration ??
                  InputDecoration(
                    counterText: "",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: false,
                    filled: widget.fillTextField,
                    fillColor: widget.backgroundColor ?? Colors.transparent,
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: widget.suffixIcon,
                    enabled: false,
                    errorStyle: const TextStyle(fontSize: 0, height: -30),
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle ??
                        TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF737380),
                        ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: const BorderSide(color: AppColors.danger),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: const BorderSide(color: AppColors.danger),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.bordercolor ?? const Color(0xFFD8D8DD),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.bordercolor ?? const Color(0xFFD8D8DD),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.bordercolor ?? const Color(0xFFD8D8DD),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ),
            ),
          ],
        ),
        if (error != null) 5.verticalSpace,
        if (error != null)
          Text(
            error!,
            style: const TextStyle(
              color: AppColors.danger,
              fontSize: 12,
            ),
          ),
        widget.padding,
      ],
    );
  }
}
