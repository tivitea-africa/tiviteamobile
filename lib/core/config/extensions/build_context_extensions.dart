import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_dialog.dart';

extension BuildContextExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  EdgeInsetsGeometry get bottomPaddingForTextField =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.bottom);

  bool get isSmallScreen => width < 400;

  // Future<T?> showBottomSheet<T>({
  //   required Widget child,
  //   Widget? widgetUnderButton,
  //   bool? showButton,
  //   bool? showTermsAndConditions,
  //   VoidCallback? onButtonPressed,

  //   ///when you call context.showBottomSheet
  //   ///the child widget should be AppBottomSheet() in your view.
  //   /// [AppBottomSheet] is a bottomsheet widget built
  //   /// with flutter widgets.
  //   /// ### Params:
  //   /// * [title] - An optional title of the view.
  //   /// * [width] - Optional preferred width of the view
  //   /// * [height] - Optional preferred height of the view
  //   /// * [content] - required body for the sheet where all your custom views
  //   /// goes in.
  //   ///
  // }) =>
  //     showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: this,
  //       builder: (context) {
  //         return LuraBottomSheet(
  //           content: child,
  //           widgetUnderButton: widgetUnderButton,
  //           showButton: showButton,
  //           showTermsAndConditions: showTermsAndConditions,
  //           onButtonPressed: onButtonPressed,
  //         );
  //       },
  //     );

  Future<T?> showCustomDialog<T>({
    required Widget child,
    bool dismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: dismissible,
        context: this,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ),
            ),
            child: AppDialog(child: child),
          );
        },
      );
}
