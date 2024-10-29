import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/services/view/pages/start_kyc_process_page.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class ServicesView extends ConsumerWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    if (user.kycIsVerified == false) {
      return const StartKYCProcessView();
    }
    return Scaffold(
      body: Center(
        child: Text(context.l10n.services),
      ),
    );
  }
}
