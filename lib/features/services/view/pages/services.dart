import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/home/view/general/all_listing_view.dart';
import 'package:tivi_tea/features/kyc/view/pages/document_submitted_view.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/features/services/view/pages/start_kyc_process_page.dart';
import 'package:tivi_tea/repositories/enums.dart';

class ServicesView extends ConsumerWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNotifierProvider);
    if (user.kycIsVerified == false) {
      if (user.kycVerificationStatus == null) {
        return const StartKYCProcessView();
      } else if (user.kycVerificationStatus ==
          KYCVerificationStatus.documentsSubmitted) {
        return const DocumentSubmitted();
      }
    }
    return const AllListingsView();
  }
}
