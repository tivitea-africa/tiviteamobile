import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_image_widget.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/view_model/services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SecondaryListingView extends ConsumerWidget {
  const SecondaryListingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listings = ref.watch(
      servicesNotiferProvider.select((value) => value.listing),
    );
    return Expanded(
      child: ListView.separated(
        itemCount: listings.length,
        separatorBuilder: (ctx, i) => 10.verticalSpace,
        itemBuilder: (ctx, i) => SecondaryListingWidget(listing: listings[i]),
      ),
    );
  }
}

class SecondaryListingWidget extends StatelessWidget {
  final ListingResponseModel listing;
  const SecondaryListingWidget({super.key, required this.listing});

  final double containerHeight = 145;

  @override
  Widget build(BuildContext context) {
    final int remainingImageCount = (listing.images?.length ?? 0) - 1;
    final bool moreThanOneImage = (listing.images?.length ?? 0) > 1;
    return Container(
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
              ],
            ),
          ),
          _ImageDetails(listing: listing)
        ],
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
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
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
              Text(
                listing.address ?? '',
                style: context.theme.textTheme.labelMedium?.copyWith(
                  fontSize: 9.8.sp,
                  color: const Color(0xFF737380),
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
                listing.amount.getCurrencyText(
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
