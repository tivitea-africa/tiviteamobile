import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/date_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/favorites/view/pages/favorites_view.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';

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
    final user = ref.watch(userNotifierProvider);
    // if (user.kycIsVerified == false) {
    //   return const StartKYCProcessView();
    // }
    if (user.entityType == EntityType.client) {
      return const FavoritesListingView();
    }
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.myListing,
        showHamburgerMenu: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: RefreshIndicator(
          onRefresh: () async => notifier.getPartnerListing(),
          child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}

class _MyListingsList extends ConsumerStatefulWidget {
  const _MyListingsList();
  @override
  ConsumerState<_MyListingsList> createState() => __MyListingsListState();
}

class __MyListingsListState extends ConsumerState<_MyListingsList> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    notifier.getPartnerListing(page: _currentPage);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    final state = ref.read(partnerServicesNotiferProvider);

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        state.listingLoadState == LoadState.success) {
      _currentPage++;
      if (state.listingLoadState == LoadState.done) {
        return;
      }
      notifier.getPartnerListing(page: _currentPage, loadmore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final partnerListings = ref.watch(
      partnerServicesNotiferProvider.select(
        (value) => value.listing,
      ),
    );
    final notifier = ref.read(partnerServicesNotiferProvider.notifier);
    return RefreshIndicator(
      onRefresh: () async => notifier.getPartnerListing(),
      child: ListView.separated(
        shrinkWrap: true,
        reverse: true,
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: partnerListings.length,
        separatorBuilder: (ctx, i) => 10.verticalSpace,
        itemBuilder: (ctx, i) {
          final listing = partnerListings[i];
          return PsrtnerListingTile(listing: listing);
        },
      ),
    );
  }
}

class PsrtnerListingTile extends ConsumerWidget {
  final ListingResponseModel listing;
  const PsrtnerListingTile({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partnerNotifier = ref.read(partnerServicesNotiferProvider.notifier);

    final deleteLoadState = ref.watch(partnerServicesNotiferProvider.select(
      (value) => value.deleteListingLoadState,
    ));
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Listing'),
            content: const Text(
              'Are you sure you want to delete this listing?',
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => context.pop(true),
                child: const Text('Delete'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        partnerNotifier.deleteListing(
          listing.id ?? '',
          onSuccess: () => partnerNotifier.getPartnerListing(),
          onError: (e) {
            partnerNotifier.getPartnerListing();
            if (e != "Null check operator used on a null value") {
              context.showError(e);
            }
          },
        );
      },
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: deleteLoadState == LoadState.loading
              ? const CircularProgressIndicator()
              : const Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: InkWell(
        onTap: () => context.push(
          '${AppRoutes.servicesView}/${AppRoutes.listingDetailsView}',
          extra: listing.id,
        ),
        child: Container(
          height: 70.h,
          width: context.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            children: [
              if (listing.images?.isNotEmpty ?? false)
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          listing.name ?? '',
                          style: context.theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          listing.rooms?.length.toString() ?? '',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listing.listingType ?? '',
                          style: context.theme.textTheme.displaySmall?.copyWith(
                            fontSize: 10.sp,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              listing.dateCreated.toDateMonthYear2,
                              style: context.theme.textTheme.displaySmall
                                  ?.copyWith(
                                fontSize: 9.sp,
                              ),
                            ),
                            10.horizontalSpace,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: listing.status?.toLowerCase() ==
                                        PartnerListingStatus.published.name
                                    ? const Color(0xFF006400).withOpacity(0.2)
                                    : const Color(0xFFF9C846),
                              ),
                              child: Text(
                                listing.status ?? '',
                                style: context.theme.textTheme.titleMedium
                                    ?.copyWith(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
