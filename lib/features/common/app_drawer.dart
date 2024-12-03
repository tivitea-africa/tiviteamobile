import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/common/customer_app_drawer.dart';
import 'package:tivi_tea/features/common/service_provider_app_drawer.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/models/enums/enums.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userNotifierProvider);
    final entityType = user.entityType ?? EntityType.client;
    return switch (entityType) {
      EntityType.partner => const ServiceProviderAppDrawer(),
      EntityType.client => const CustomerAppDrawer(),
    };
  }
}