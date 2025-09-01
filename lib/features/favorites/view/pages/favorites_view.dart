import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/favorites/model/favorite_listing_model.dart';
import 'package:tivi_tea/features/favorites/view_model/favorite_listing_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class FavoritesListingView extends ConsumerWidget {
  const FavoritesListingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(
      favoriteListingNotifierProvider.select((value) => value.favorites),
    );
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.myFavorites,
        showHamburgerMenu: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: favorites.isEmpty
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          20.verticalSpace,
          if (favorites.isEmpty)
            Center(
              child: Text(
                'No Favorites added',
                style: context.theme.textTheme.displaySmall,
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                itemCount: favorites.length,
                separatorBuilder: (ctx, i) => 10.verticalSpace,
                itemBuilder: (ctx, i) =>
                    _SecondaryListingWidget(favoriteListing: favorites[i]),
              ),
            ),
        ],
      ),
    );
  }
}

class _SecondaryListingWidget extends StatelessWidget {
  final FavoriteListingModel favoriteListing;
  const _SecondaryListingWidget({
    required this.favoriteListing,
  });

  final double containerHeight = 145;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(
        '${AppRoutes.servicesView}/${AppRoutes.listingDetailsView}',
        extra: favoriteListing.id,
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
                  AppImageWidget(
                    imagePath: favoriteListing.images?.first ?? '',
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.sp),
                      bottomLeft: Radius.circular(8.sp),
                    ),
                  ),
                  Consumer(
                    builder: (contex, ref, _) {
                      final state = ref.watch(favoriteListingNotifierProvider);

                      //Would not be very performant as data size increases
                      final isFavorite = state.favorites
                          .any((fav) => fav.id == favoriteListing.id);
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
            Flexible(child: _ImageDetails(favoriteListing: favoriteListing))
          ],
        ),
      ),
    );
  }

  void _favoriteListing(WidgetRef ref) {
    final notifier = ref.read(
      favoriteListingNotifierProvider.notifier,
    );

    notifier.toggleFavoriteStatus(favoriteListing);
  }
}

class _ImageDetails extends StatelessWidget {
  final FavoriteListingModel favoriteListing;
  const _ImageDetails({required this.favoriteListing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            favoriteListing.name ?? '',
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontSize: 16.sp,
              color: context.theme.primaryColor,
            ),
          ),
          5.verticalSpace,
          Row(
            children: [
              Flexible(
                // width: ,
                child: Text(
                  favoriteListing.description ?? '',
                  style: context.theme.textTheme.labelMedium?.copyWith(
                    fontSize: 9.8.sp,
                    color: const Color(0xFF737380),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: context.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppSvgWidget(path: Assets.svgs.star),
                    5.horizontalSpace,
                    Text("${favoriteListing.rating ?? 0}")
                  ],
                ),
                const Spacer(),
                favoriteListing.amount.getCurrencyText(
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
