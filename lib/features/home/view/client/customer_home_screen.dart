import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/favorites/view_model/favorite_listing_notifier.dart';
import 'package:tivi_tea/features/home/view/widgets/category_section.dart';
import 'package:tivi_tea/features/home/view/widgets/home_container.dart';
import 'package:tivi_tea/features/home/view/widgets/welcome_back_text.dart';
import 'package:tivi_tea/features/profile/view_model/profile_notifer.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';

class CustomerHomeScreen extends ConsumerStatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  ConsumerState<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends ConsumerState<CustomerHomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(servicesNotiferProvider.notifier).getCategories();
    ref.read(servicesNotiferProvider.notifier).getListing();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoriteListingNotifierProvider.notifier).getFavoriteListings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(homeScreenAppBar: true),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(profileNotiferProvider.notifier).getUserProfile();
          ref.read(servicesNotiferProvider.notifier).getCategories();
          ref.read(servicesNotiferProvider.notifier).getListing();
        },
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeBackText(),
              HomeViewContainer(),
              CategorySection(),
            ],
          ),
        ),
      ),
    );
  }
}
