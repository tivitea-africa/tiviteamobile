import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';

class WithdrawalView extends StatelessWidget {
  const WithdrawalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appbar: CustomAppBar(),
      body: Column(
        children: [
          Text('Withdrawal'),
        ],
      ),
    );
  }
}
