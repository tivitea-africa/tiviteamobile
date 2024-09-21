import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/widgets/welcome_back_text.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appbar: CustomAppBar(),
      body: Column(
        children: [
          WelcomeBackText(),
        ],
      ),
    );
  }
}
