import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/home/view_model/dashboard_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class DashboardGrid extends ConsumerWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardInfo = ref.watch(
      dashboardNotiferProvider.select((value) => value.model),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 12.w,
          runSpacing: 15.h,
          children: [
            DashboardInfoContainer(
              title: context.l10n.totalBooking,
              value: dashboardInfo?.totalBookings ?? 0,
              bookingContainerColor: const Color(0xFF2196F3),
            ),
            DashboardInfoContainer(
              title: context.l10n.totalListing,
              value: dashboardInfo?.totalListings ?? 0,
              bookingContainerColor: const Color(0xFFFF5B5B),
            ),
            DashboardInfoContainer(
              title: context.l10n.totalEarning,
              value: dashboardInfo?.totalRevenue ?? 0,
              bookingContainerColor: const Color(0xFF02952B),
            ),
            DashboardInfoContainer(
              title: context.l10n.totalBooking,
              value: dashboardInfo?.totalBookings ?? 0,
              bookingContainerColor: const Color(0xFF2196F3),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardInfoContainer extends StatelessWidget {
  final String title;
  final num value;
  final Color bookingContainerColor;
  const DashboardInfoContainer({
    super.key,
    required this.title,
    required this.value,
    required this.bookingContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 170.h, //context.width,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0.0, 5),
            color: Colors.black.withOpacity(0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.theme.textTheme.labelMedium?.copyWith(
                  color: const Color(0xFF565656),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bookingContainerColor,
                ),
                child: Center(
                  child: AppSvgWidget(path: Assets.svgs.brandBooking),
                ),
              )
            ],
          ),
          Text(
            value.toString(),
            style: context.theme.textTheme.titleMedium?.copyWith(
              color: const Color(0xFF3F3F3F),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                context.l10n.viewAll,
                style: context.theme.textTheme.labelMedium?.copyWith(
                  fontSize: 9.sp,
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(0xFF5041BC),
                  color: const Color(0xFF5041BC),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
