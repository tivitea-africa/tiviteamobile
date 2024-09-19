import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_dialog.dart';

enum SnackbarState { error, success }

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
        barrierLabel: 'appDialog',
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

  void showSnackbar({
    required String message,
    required SnackbarState state,
  }) {
    final color = state == SnackbarState.error ? Colors.red : Colors.green;
    final overlay = Overlay.of(this);

    final animationController = AnimationController(
      vsync: Navigator.of(this),
      duration: const Duration(milliseconds: 300),
    );

    final animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: 16,
        right: 16,
        child: SlideTransition(
          position: animation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      animationController.reverse().then((_) {
        overlayEntry.remove();
      });
    });
  }

  void showError(String message) {
    showSnackbar(message: message, state: SnackbarState.error);
  }

  void showSuccess(String message) {
    showSnackbar(message: message, state: SnackbarState.success);
  }
}
