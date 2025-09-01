import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/widget/custom_pin_text_field.dart';

/// A customizable PIN input widget with various configuration options.
///
/// Features:
/// - Customizable number of PIN digits
/// - Optional built-in text field or external controller
/// - Haptic feedback support
/// - Fully customizable styling
/// - Callback functions for various events
/// - Proper controller disposal
class CustomPinWidget extends StatefulWidget {
  /// The number of PIN digits to display (optional if showTextField is false)
  final int pinCount;

  /// Controller for managing PIN input
  final TextEditingController? controller;

  /// Whether to show the built-in text field
  final bool showTextField;

  /// Callback when PIN is completed
  final Function(String)? onCompleted;

  /// Callback when PIN changes
  final Function(String)? onChanged;

  /// Callback when PIN is submitted
  final Function(String)? onSubmit;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Spacing between text field and number buttons (when showTextField is true)
  final double textFieldSpacing;

  /// Background color for number buttons
  final Color? numberBackgroundColor;

  /// Text color for number buttons
  final Color? numberTextColor;

  /// Container width for number buttons
  final double? numberWidth;

  /// Container height for number buttons
  final double? numberHeight;

  /// Border radius for number buttons
  final double? numberBorderRadius;

  /// Border for number buttons
  final Border? numberBorder;

  /// Font size for number buttons
  final double? numberFontSize;

  /// Font weight for number buttons
  final FontWeight? numberFontWeight;

  /// Background color for the delete button
  final Color? deleteButtonColor;

  /// Icon color for the delete button
  final Color? deleteIconColor;

  /// Icon for the delete button
  final IconData? deleteIcon;

  /// Whether to show the delete button
  final bool showDeleteButton;

  /// Spacing between number buttons
  final double numberSpacing;

  /// Spacing between rows of number buttons
  final double rowSpacing;

  /// Whether to auto-focus the text field when widget is built
  final bool autoFocus;

  /// Text input action for the text field
  final TextInputAction? textInputAction;

  /// Keyboard type for the text field
  final TextInputType? keyboardType;

  /// Whether to obscure the PIN text
  final bool obscureText;

  /// Character to show when PIN is obscured
  final String obscureCharacter;

  /// Whether to enable the widget
  final bool enabled;

  /// Focus node for the text field
  final FocusNode? focusNode;

  CustomPinWidget({
    super.key,
    this.pinCount = 4,
    this.controller,
    this.showTextField = true,
    this.onCompleted,
    this.onChanged,
    this.onSubmit,
    this.enableHapticFeedback = false,
    this.textFieldSpacing = 10.0,
    this.numberBackgroundColor,
    this.numberTextColor,
    this.numberWidth,
    this.numberHeight,
    this.numberBorderRadius,
    this.numberBorder,
    this.numberFontSize,
    this.numberFontWeight,
    this.deleteButtonColor,
    this.deleteIconColor,
    this.deleteIcon,
    this.showDeleteButton = true,
    this.numberSpacing = 8.0,
    this.rowSpacing = 12.0,
    this.autoFocus = false,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.obscureCharacter = '•',
    this.enabled = true,
    this.focusNode,
  }) {
    // Validate that pinCount is provided when showTextField is true
    if (showTextField && (pinCount <= 0)) {
      throw ArgumentError(
          'PIN count must be provided and greater than 0 when showTextField is true');
    }
  }

  @override
  State<CustomPinWidget> createState() => _CustomPinWidgetState();
}

class _CustomPinWidgetState extends State<CustomPinWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isControllerInternal = false;

  @override
  void initState() {
    super.initState();

    // Initialize controller
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController();
      _isControllerInternal = true;
    }

    // Initialize focus node
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    } else {
      _focusNode = FocusNode();
    }

    // Add listener for callbacks
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);

    // Only dispose if it's an internal controller
    if (_isControllerInternal) {
      _controller.dispose();
    }

    // Only dispose focus node if it's internal
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  void _onNumberPressed(String number) {
    if (!widget.enabled) return;

    // If no pinCount is set, allow unlimited input
    if (_controller.text.length < widget.pinCount) {
      setState(() {
        _controller.text += number;
      });

      // Haptic feedback
      if (widget.enableHapticFeedback) {
        HapticFeedback.lightImpact();
      }
    }
  }

  void _onDeletePressed() {
    if (!widget.enabled) return;

    if (_controller.text.isNotEmpty) {
      setState(() {
        _controller.text =
            _controller.text.substring(0, _controller.text.length - 1);
      });

      // Haptic feedback
      if (widget.enableHapticFeedback) {
        HapticFeedback.lightImpact();
      }
    }
  }

  void _onSubmitPressed() {
    if (!widget.enabled) return;

    final text = _controller.text;
    // Only check completion if pinCount is set
    if (text.length == widget.pinCount) {
      widget.onSubmit?.call(text);

      // Haptic feedback
      if (widget.enableHapticFeedback) {
        HapticFeedback.mediumImpact();
      }
    }
  }

  void _onTextChanged() {
    final text = _controller.text;

    // Call onChanged callback
    widget.onChanged?.call(text);

    // Call onCompleted callback when PIN is complete
    if (text.length == widget.pinCount) {
      widget.onCompleted?.call(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text field (optional)
        if (widget.showTextField) ...[
          CustomPinTextField(
            pinCount: widget.pinCount,
            controller: _controller,
            obscureText: widget.obscureText,
            obscureCharacter: widget.obscureCharacter,
            enabled: widget.enabled,
          ),
          SizedBox(height: widget.textFieldSpacing.h),
        ],

        // Number pad
        _buildNumberPad(),
      ],
    );
  }

  Widget _buildNumberPad() {
    final numbers = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];

    return Column(
      children: [
        // First three rows with numbers
        ...numbers.asMap().entries.map((entry) {
          // final rowIndex = entry.key;
          final row = entry.value;

          return Padding(
            padding: EdgeInsets.only(bottom: widget.rowSpacing.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  row.map((number) => _buildNumberButton(number)).toList(),
            ),
          );
        }),

        // Bottom row with delete, 0, and submit
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Delete button
            widget.showDeleteButton
                ? _buildDeleteButton()
                : SizedBox(width: widget.numberWidth ?? 60.w),

            // Number 0
            _buildNumberButton('0'),

            // Submit button or empty space
            _controller.text.length == widget.pinCount
                ? _buildSubmitButton()
                : SizedBox(width: widget.numberWidth ?? 60.w),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    final isEnabled = widget.enabled && number.isNotEmpty;

    return GestureDetector(
      onTap: isEnabled ? () => _onNumberPressed(number) : null,
      child: Container(
        width: widget.numberWidth ?? 60.w,
        height: widget.numberHeight ?? 60.h,
        decoration: BoxDecoration(
          color: widget.numberBackgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(
            widget.numberBorderRadius ?? 30.r,
          ),
          border: widget.numberBorder,
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontSize: widget.numberFontSize ?? 24.sp,
              fontWeight: widget.numberFontWeight ?? FontWeight.w600,
              color: widget.numberTextColor ?? const Color(0xFF000050),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    final isEnabled = widget.enabled && _controller.text.isNotEmpty;

    return GestureDetector(
      onTap: isEnabled ? _onDeletePressed : null,
      child: Container(
        width: widget.numberWidth ?? 60.w,
        height: widget.numberHeight ?? 60.h,
        decoration: BoxDecoration(
          color: widget.deleteButtonColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(
            widget.numberBorderRadius ?? 30.r,
          ),
          border: widget.numberBorder,
        ),
        child: Center(
          child: Icon(
            widget.deleteIcon ?? Icons.backspace_outlined,
            color: isEnabled
                ? (widget.deleteIconColor ?? const Color(0xFF000050))
                : Colors.grey.shade400,
            size: 18.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: widget.enabled ? _onSubmitPressed : null,
      child: Container(
        width: widget.numberWidth ?? 60.w,
        height: widget.numberHeight ?? 60.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            widget.numberBorderRadius ?? 30.r,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}

/// Extension to provide easy access to PIN controller methods
extension CustomPinController on TextEditingController {
  /// Clears the PIN input
  void clearPin() {
    clear();
  }

  /// Gets the current PIN value
  String get pinValue => text;

  /// Checks if the PIN is complete
  bool get isPinComplete => text.isNotEmpty;

  /// Gets the PIN length
  int get pinLength => text.length;
}
