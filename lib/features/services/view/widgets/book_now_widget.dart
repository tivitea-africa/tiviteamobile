import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookNowContainer extends StatelessWidget {
  final ListingResponseModel listing;
  const BookNowContainer({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE8E8EB),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 5),
            blurRadius: 3,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: '${context.l10n.youCan} ',
              style: context.theme.textTheme.displaySmall?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF737380),
              ),
              children: [
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.getQuotation,
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                        color: const Color(0xFF737380),
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              context.l10n.pricesAreAvailable,
              style: context.theme.textTheme.displaySmall?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF737380),
              ),
            ),
          ),
          20.verticalSpace,
          AppButton(
            buttonText: context.l10n.bookNow,
            onPressed: () => context.push(
              '${AppRoutes.servicesView}/${AppRoutes.bookListingView}',
              extra: listing,
            ),
          ),
        ],
      ),
    );
  }
}
