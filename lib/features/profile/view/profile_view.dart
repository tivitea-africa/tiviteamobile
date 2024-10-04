import 'package:flutter/material.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(showHamburgerMenu: true),
      body: Center(
        child: Text(context.l10n.profile),
      ),
    );
  }
}