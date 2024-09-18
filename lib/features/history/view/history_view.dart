import 'package:flutter/material.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.l10n.myHistory),
      ),
    );
  }
}