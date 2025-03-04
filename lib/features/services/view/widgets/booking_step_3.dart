import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/view/pages/listing_detail_view.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookingStep3 extends StatelessWidget {
  final Room? room;
  final ListingResponseModel listing;
  final VoidCallback naviagte;
  const BookingStep3({
    super.key,
    required this.room,
    required this.listing,
    required this.naviagte,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          room == null ? listing.name ?? '' : room?.name ?? '',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 22,
            color: context.theme.primaryColor,
          ),
        ),
        10.verticalSpace,
        if (room != null)
          Text(
            listing.name ?? '',
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              color: const Color(0xFF737380).withOpacity(0.6),
            ),
          ),
        Text(
          listing.address ?? '',
          style: context.theme.textTheme.displaySmall?.copyWith(
            fontSize: 11,
            color: const Color(0xFF737380).withOpacity(0.6),
          ),
        ),
        15.verticalSpace,
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE8E8EB),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (room?.images?.isNotEmpty ?? false)
                ListingImagesView(
                  images: room?.images ?? [],
                  fit: BoxFit.cover,
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Text(
                  room?.name ?? '',
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    color: const Color(0xFF5C5C66),
                  ),
                ),
              ),
              if (room?.features?.isNotEmpty ?? false)
                AmenitiesRow(amenties: room?.features ?? []),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.total,
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xFF5C5C66),
                          ),
                        ),
                        Text(
                          'Payment Includes Tax',
                          style: context.theme.textTheme.displaySmall?.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xFF5C5C66),
                          ),
                        ),
                      ],
                    ),
                    if (room != null)
                      room!.amount.getCurrencyText(
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.danger,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: AppButton(
            buttonText: context.l10n.continue_,
            onPressed: naviagte,
          ),
        ),
      ],
    );
  }
}
