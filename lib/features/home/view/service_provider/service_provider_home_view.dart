import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/widgets/category_section.dart';
import 'package:tivi_tea/features/home/view/widgets/home_container.dart';
import 'package:tivi_tea/features/home/view/widgets/welcome_back_text.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';

class ServiceProviderHomeScreen extends ConsumerStatefulWidget {
  const ServiceProviderHomeScreen({super.key});

  @override
  ConsumerState<ServiceProviderHomeScreen> createState() => _ServiceProviderHomeScreenState();
}

class _ServiceProviderHomeScreenState extends ConsumerState<ServiceProviderHomeScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(servicesNotiferProvider.notifier).getCategories();
    ref.read(servicesNotiferProvider.notifier).getListing();
  }

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appbar: CustomAppBar(homeScreenAppBar: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeBackText(),
          HomeViewContainer(),
          CategorySection(),
        ],
      ),
    );
  }
}
