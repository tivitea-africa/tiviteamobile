import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appbar: CustomAppBar(
        title: 'Payment',
        showHamburgerMenu: true,
      ),
      body: Column(
        children: [
          Text('Payment'),
        ],
      ),
    );
  }
}
