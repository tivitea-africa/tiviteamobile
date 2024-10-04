import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class MyListingView extends StatelessWidget {
  const MyListingView({super.key});

  @override
  Widget build(BuildContext context) {
    const createListingPath =
        '${AppRoutes.myListingView}/${AppRoutes.createListingView}';
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.myListing,
        showHamburgerMenu: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CreateListingButton(
                  text: context.l10n.addnew,
                  onTap: () => context.push(createListingPath),
                ),
              ],
            ),
            10.verticalSpace,
            Container(
              width: context.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8EB),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const _MyListingsList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyListingsList extends ConsumerWidget {
  const _MyListingsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (ctx, i) => 10.verticalSpace,
      itemBuilder: (ctx, i) {
        return Container(
          height: 70.h,
          width: context.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            children: [],
          ),
        );
      },
    );
  }
}
