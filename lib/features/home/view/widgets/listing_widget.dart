import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/onboarding/view/widgets/slide_indicator.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';

class ListingsView extends ConsumerWidget {
  const ListingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listings = ref.watch(
      servicesNotiferProvider.select((value) => value.listing),
    );
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          width: context.width,
          child: Padding(
            padding: EdgeInsets.only(left: 18.w, top: 10.h),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: listings.length,
              shrinkWrap: true,
              separatorBuilder: (ctx, i) => 10.horizontalSpace,
              itemBuilder: (ctx, i) => _ListingWidget(listing: listings[i]),
            ),
          ),
        ),
        10.verticalSpace
      ],
    );
  }
}

class _ListingWidget extends StatefulWidget {
  final ListingResponseModel listing;
  const _ListingWidget({required this.listing});

  @override
  State<_ListingWidget> createState() => __ListingWidgetState();
}

class __ListingWidgetState extends State<_ListingWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(
        '${AppRoutes.servicesView}/${AppRoutes.listingDetailsView}',
        extra: widget.listing,
      ),
      child: Container(
        width: context.width / 1.5,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.0, 5),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 7.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: PageView.builder(
                      itemCount: widget.listing.images?.length,
                      itemBuilder: (ctx, i) {
                        final imagePath = widget.listing.images?[i] ?? '';
                        return AppImageWidget(imagePath: imagePath);
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Visibility(
                      visible: (widget.listing.images?.length ?? 0) > 1,
                      child: SlideIndicatorWidget(
                        slideLength: widget.listing.images?.length ?? 0,
                        currentIndex: currentIndex,
                      ),
                    ),
                  )
                ],
              ),
            ),
            _ImageDetails(listing: widget.listing),
          ],
        ),
      ),
    );
  }
}

class _ImageDetails extends StatelessWidget {
  final ListingResponseModel listing;
  const _ImageDetails({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listing.name ?? '',
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontSize: 14.sp,
            ),
          ),
          Text(
            listing.address ?? '',
            style: context.theme.textTheme.labelMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(),
              listing.amount.getCurrencyText(
                style: context.theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.danger,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
