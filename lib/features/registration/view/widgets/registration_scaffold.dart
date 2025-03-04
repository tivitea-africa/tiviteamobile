import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationScaffold extends StatelessWidget {
  const RegistrationScaffold({
    required this.body,
    super.key,
    this.resizeToAvoidBottomInset,
    this.appbar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.footerButton,
    this.underFooterChild,
    this.bodyPadding,
  });
  final Widget body;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appbar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? footerButton;
  final Widget? underFooterChild;
  final EdgeInsetsGeometry? bodyPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(color: Colors.transparent),
        ),
        child: Scaffold(
          appBar: appbar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: Padding(
            padding: bodyPadding ?? EdgeInsets.symmetric(horizontal: 18.w),
            child: body,
          ),
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
