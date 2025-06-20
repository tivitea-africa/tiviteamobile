import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';

/// A customizable PIN text field widget that displays PIN digits as individual containers.
///
/// Features:
/// - Customizable number of PIN digits
/// - Optional text obscuring
/// - Fully customizable styling
/// - Pure display widget - no callback handling
/// - Proper controller integration
class CustomPinTextField extends StatelessWidget {
  /// The number of PIN digits to display
  final int pinCount;

  /// Controller for managing PIN input
  final TextEditingController controller;

  /// Whether to obscure the PIN text
  final bool obscureText;

  /// Character to show when PIN is obscured
  final String obscureCharacter;

  /// Whether to enable the widget
  final bool enabled;

  /// Width of each digit container
  final double? digitWidth;

  /// Height of each digit container
  final double? digitHeight;

  /// Border radius for digit containers
  final double? digitBorderRadius;

  /// Border for digit containers
  final Border? digitBorder;

  /// Font size for digit text
  final double? digitFontSize;

  /// Font weight for digit text
  final FontWeight? digitFontWeight;

  /// Color for filled digit text
  final Color? filledDigitColor;

  /// Color for empty digit text
  final Color? emptyDigitColor;

  /// Color for filled digit border
  final Color? filledBorderColor;

  /// Color for empty digit border
  final Color? emptyBorderColor;

  /// Background color for digit containers
  final Color? digitBackgroundColor;

  /// Border width for digit containers
  final double? borderWidth;

  CustomPinTextField({
    super.key,
    required this.pinCount,
    required this.controller,
    this.obscureText = false,
    this.obscureCharacter = '•',
    this.enabled = true,
    this.digitWidth,
    this.digitHeight,
    this.digitBorderRadius,
    this.digitBorder,
    this.digitFontSize,
    this.digitFontWeight,
    this.filledDigitColor,
    this.emptyDigitColor,
    this.filledBorderColor,
    this.emptyBorderColor,
    this.digitBackgroundColor,
    this.borderWidth,
  }) {
    // Validate that pinCount is provided and greater than 0
    if (pinCount <= 0) {
      throw ArgumentError('PIN count must be greater than 0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(pinCount, (index) {
        final digit = index < controller.text.length
            ? (obscureText ? obscureCharacter : controller.text[index])
            : '';

        final isFilled = digit.isNotEmpty;

        return Container(
          width: digitWidth ?? 50.w,
          height: digitHeight ?? 50.h,
          decoration: BoxDecoration(
            border: digitBorder ??
                Border.all(
                  color: isFilled
                      ? (filledBorderColor ?? context.theme.primaryColor)
                      : (emptyBorderColor ?? Colors.grey.shade300),
                  width: borderWidth ?? 2,
                ),
            borderRadius: BorderRadius.circular(digitBorderRadius ?? 8.r),
            color: digitBackgroundColor ?? Colors.transparent,
          ),
          child: Center(
            child: Text(
              digit,
              style: TextStyle(
                fontSize: digitFontSize ?? 24.sp,
                fontWeight: digitFontWeight ?? FontWeight.w600,
                color: isFilled
                    ? (filledDigitColor ?? context.theme.primaryColor)
                    : (emptyDigitColor ?? Colors.grey.shade400),
              ),
            ),
          ),
        );
      }),
    );
  }
}

/// Extension to provide easy access to PIN text field methods
extension CustomPinTextFieldController on TextEditingController {
  /// Clears the PIN input
  void clearPin() {
    clear();
  }

  /// Gets the current PIN value
  String get pinValue => text;

  /// Checks if the PIN is complete for a given length
  bool isPinComplete(int pinCount) => text.length == pinCount;

  /// Gets the PIN length
  int get pinLength => text.length;
} 