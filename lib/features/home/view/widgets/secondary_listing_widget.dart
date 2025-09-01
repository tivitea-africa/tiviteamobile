import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_model.dart';
import 'package:tivi_tea/features/favorites/view_model/favorite_listing_notifier.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/model/enums.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SecondaryListingView extends ConsumerStatefulWidget {
  const SecondaryListingView({super.key});

  @override
  ConsumerState<SecondaryListingView> createState() =>
      _SecondaryListingViewState();
}

class _SecondaryListingViewState extends ConsumerState<SecondaryListingView> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final notifier = ref.read(servicesNotiferProvider.notifier);
    final state = ref.read(servicesNotiferProvider);

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        state.listingLoadState == LoadState.success) {
      _currentPage++;
      if (state.listingLoadState == LoadState.done) {
        return;
      }
      notifier.getListing(page: _currentPage, loadmore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final listings = ref.watch(
      servicesNotiferProvider.select((value) => value.listing),
    );
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          _currentPage = 1;
          final notifier = ref.read(servicesNotiferProvider.notifier);
          notifier.getListing();
        },
        child: listings.isEmpty
            ? Center(child: Text('No listings found', style: context.theme.textTheme.displaySmall))
            : ListView.separated(
                controller: _scrollController,
                itemCount: listings.length,
                separatorBuilder: (ctx, i) => 10.verticalSpace,
                itemBuilder: (ctx, i) => SecondaryListingWidget(
                  listing: listings[i],
                ),
              ),
      ),
    );
  }
}

class SecondaryListingWidget extends StatelessWidget {
  final ListingResponseModel listing;
  const SecondaryListingWidget({
    super.key,
    required this.listing,
  });

  final double containerHeight = 145;

  @override
  Widget build(BuildContext context) {
    final int remainingImageCount = (listing.images?.length ?? 0) - 1;
    final bool moreThanOneImage = (listing.images?.length ?? 0) > 1;
    return InkWell(
      onTap: () => context.go(
        '${AppRoutes.servicesView}/${AppRoutes.listingDetailsView}',
        extra: listing.id,
      ),
      child: Container(
        width: context.width,
        height: containerHeight.h,
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: const Color(0xFFD8D8DD),
          ),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Row(
          children: [
            SizedBox(
              width: containerHeight.w,
              height: containerHeight.h,
              child: Stack(
                children: [
                  if (listing.images?.isNotEmpty ?? false)
                    AppImageWidget(
                      imagePath: listing.images?.first ?? '',
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.sp),
                        bottomLeft: Radius.circular(8.sp),
                      ),
                    ),
                  if (moreThanOneImage)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.theme.primaryColor,
                        ),
                        child: Text(
                          '${remainingImageCount.toString()}+',
                          style: context.theme.textTheme.displaySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  Consumer(
                    builder: (contex, ref, _) {
                      final state = ref.watch(favoriteListingNotifierProvider);

                      //Would not be very performant as data size increases
                      final isFavorite = state.favorites.any(
                        (fav) => fav.id == listing.id,
                      );
                      return Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () => _favoriteListing(ref),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            margin: EdgeInsets.all(10.sp),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF3EBEB),
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            _ImageDetails(listing: listing)
          ],
        ),
      ),
    );
  }

  void _favoriteListing(WidgetRef ref) {
    final notifier = ref.read(
      favoriteListingNotifierProvider.notifier,
    );

    final data = FavoriteListingModel.fromListingModel(listing);

    notifier.toggleFavoriteStatus(data, onSuccess: () {
      ref.read(servicesNotiferProvider.notifier).getListing();
    });
  }
}

class _ImageDetails extends StatelessWidget {
  final ListingResponseModel listing;
  const _ImageDetails({required this.listing});

  @override
  Widget build(BuildContext context) {
    final listingType = listing.listingType?.enumType;
    final isListingTypeWorkSpace = listingType == CreateListingType.workSpace;
    final amount = isListingTypeWorkSpace
        ? listing.rooms?.first.amount
        : listing.amountPlusFootSoldierFee;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listing.name ?? '',
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontSize: 16.sp,
              color: context.theme.primaryColor,
            ),
          ),
          5.verticalSpace,
          Row(
            children: [
              AppSvgWidget(path: Assets.svgs.location),
              5.horizontalSpace,
              SizedBox(
                width: 150.w,
                child: Text(
                  listing.address ?? '',
                  style: context.theme.textTheme.labelMedium?.copyWith(
                    fontSize: 9.8.sp,
                    color: const Color(0xFF737380),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 196,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.l10n.listedBy}:',
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        fontSize: 9.8.sp,
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          '${listing.partner?.user?.firstName ?? ''} ${listing.partner?.user?.lastName ?? ''}',
                          style: context.theme.textTheme.displaySmall?.copyWith(
                            fontSize: 9.8.sp,
                            color: const Color(0xFF77797D),
                          ),
                        ),
                        if (listing.partner?.user?.isVerified ?? false)
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: AppSvgWidget(path: Assets.svgs.verified),
                          )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                amount.getCurrencyText(
                  style: context.theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.theme.primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
