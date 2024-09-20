import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/common/customer_app_drawer.dart';
import 'package:tivi_tea/features/common/service_provider_app_drawer.dart';
import 'package:tivi_tea/models/enums/enums.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(currentUserProvider);
    final entityType = user.entityType ?? EntityType.client;
    return switch (entityType) {
      EntityType.partner => const ServiceProviderAppDrawer(),
      EntityType.client => const CustomerAppDrawer(),
    };
  }
}