import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/home/view/client/customer_home_screen.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_home_view.dart';
import 'package:tivi_tea/models/enums/enums.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class GeneralHomeScreeen extends ConsumerWidget {
  const GeneralHomeScreeen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final entityType = user.entityType ?? EntityType.client;
    return switch (entityType) {
      EntityType.partner => const ServiceProviderHomeScreen(),
      EntityType.client => const CustomerHomeScreen(),
    };
  }
}
