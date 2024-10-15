import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/date_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class MyListingView extends ConsumerStatefulWidget {
  const MyListingView({super.key});

  @override
  ConsumerState<MyListingView> createState() => _MyListingViewState();
}

class _MyListingViewState extends ConsumerState<MyListingView> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    notifier.getPartnerListing();
  }

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
    final partnerListings = ref.watch(
      partnerServicesNotiferProvider.select(
        (value) => value.listing,
      ),
    );
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: partnerListings.length,
      separatorBuilder: (ctx, i) => 10.verticalSpace,
      itemBuilder: (ctx, i) {
        final listing = partnerListings[i];
        return PsrtnerListingTile(listing: listing);
      },
    );
  }
}

class PsrtnerListingTile extends StatelessWidget {
  final ListingResponseModel listing;
  const PsrtnerListingTile({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: context.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 35.w,
            height: 35.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: AppImageWidget(
              imagePath: listing.images?.first ?? '',
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          5.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listing.name ?? '',
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Text(
                listing.listingType ?? '',
                style: context.theme.textTheme.displaySmall?.copyWith(
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                listing.rooms?.length.toString() ?? '',
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Row(
                children: [
                  Text(
                    listing.dateCreated.toDateMonthYear2,
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      fontSize: 9.sp,
                    ),
                  ),
                  10.horizontalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: listing.status?.toLowerCase() ==
                              PartnerListingStatus.published.name
                          ? const Color(0xFF006400).withOpacity(0.2)
                          : const Color(0xFFF9C846),
                    ),
                    child: Text(
                      listing.status ?? '',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontSize: 10.sp,
                        color: listing.status?.toLowerCase() ==
                                PartnerListingStatus.published.name
                            ? const Color(0xFF006400)
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
