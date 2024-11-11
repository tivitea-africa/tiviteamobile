import 'package:flutter/material.dart';
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
import 'package:tivi_tea/features/home/model/general/booking_summary_params.dart';
import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ChooseRoomView extends StatelessWidget {
  final ChooseRoomViewParams params;
  const ChooseRoomView({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        showHamburgerMenu: true,
        showBackButtonForHomeScreenAppBar: true,
        onHomeBackButtonTap: () => context.pop(),
        title: context.l10n.chooseRoom,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: params.rooms.length,
              itemBuilder: (ctx, i) => _RoomListingWidget(
                room: params.rooms[i],
                bookingSummaryParams: params.bookingSummaryParams,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RoomListingWidget extends StatelessWidget {
  final Room room;
  final BookingSummaryParams bookingSummaryParams;
  const _RoomListingWidget({
    required this.room,
    required this.bookingSummaryParams,
  });

  final double containerHeight = 145;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        '${AppRoutes.servicesView}/${AppRoutes.bookingSummaryView}',
        extra: bookingSummaryParams.copyWith(roomId: room.id),
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
              child: AppImageWidget(
                imagePath: room.images?.first ?? '',
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.sp),
                  bottomLeft: Radius.circular(8.sp),
                ),
              ),
            ),
            Flexible(child: _ImageDetails(room: room))
          ],
        ),
      ),
    );
  }
}

class _ImageDetails extends StatelessWidget {
  final Room room;
  const _ImageDetails({required this.room});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            room.name ?? '',
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
                  room.description ?? '',
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
                room.amount.getCurrencyText(
                  style: context.theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.theme.primaryColor,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: context.theme.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Text(
                        context.l10n.chooseRoom,
                        style: context.theme.textTheme.displaySmall?.copyWith(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                      5.horizontalSpace,
                      AppSvgWidget(path: Assets.svgs.arrowRight),
                    ],
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
