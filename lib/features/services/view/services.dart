import 'package:flutter/material.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.l10n.services),
      ),
    );
  }
}