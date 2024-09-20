import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.drawer,
    super.key,
    this.resizeToAvoidBottomInset,
    this.appbar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.footerButton,
    this.underFooterChild,
    this.bodyPadding,
    this.extendBody = false,
    this.showSkip = false,
  });
  final Widget body;
  final Widget? drawer;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appbar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? footerButton;
  final Widget? underFooterChild;
  final EdgeInsetsGeometry? bodyPadding;
  final bool extendBody;
  final bool showSkip;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(color: Colors.transparent),
        ),
        child: Scaffold(
          appBar: appbar ?? const CustomAppBar(),
          drawer: drawer,
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body:body,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          // persistentFooterButtons: (footerButton != null)
          //     ? [
          //         Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
          //           child: Container(
          //             margin: context.bottomPaddingForTextField,
          //             child: Column(
          //               children: [
          //                 footerButton!,
          //                 10.verticalSpace,
          //                 if (underFooterChild != null) underFooterChild!
          //               ],
          //             ),
          //           ),
          //         ),
          //       ]
          //     : null,
          extendBody: extendBody,
        ),
      ),
    );
  }
}
