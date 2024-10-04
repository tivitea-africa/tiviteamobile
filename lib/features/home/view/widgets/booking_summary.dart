import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/home/model/service_provider/service_provider_dashboard_model.dart';
import 'package:tivi_tea/features/home/view_model/dashboard_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BookingSummarySection extends ConsumerWidget {
  const BookingSummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardInfo = ref.watch(
      dashboardNotiferProvider.select((value) => value.model),
    );
    return Container(
      //height: 300,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 18.h),
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
          Text(
            context.l10n.bookingSummary,
            style: context.theme.textTheme.titleMedium?.copyWith(
              color: context.theme.primaryColor,
              fontSize: 16.sp,
            ),
          ),
          AspectRatio(
            aspectRatio: 2.3,
            child: Row(
              children: [
                _PieChart(model: dashboardInfo?.bookingSummary),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: const _PieChartColorInfo(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PieChart extends StatelessWidget {
  final BookingSummary? model;
  const _PieChart({required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: _chartSections(context),
        ),
      ),
    );
  }

  List<PieChartSectionData> _chartSections(BuildContext context) {
    const double radius = 70.0;
    final titleStyle = context.theme.textTheme.labelMedium?.copyWith(
      fontSize: 10.sp,
      color: Colors.black,
    );
    return List.generate(3, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            radius: radius,
            color: const Color(0xFF2196F3),
            value: 30, //formatPercentageToDouble(model?.incoming),
            title: '30%', //model?.incoming,
            titleStyle: titleStyle,
          );
        case 1:
          return PieChartSectionData(
            radius: radius,
            color: const Color(0xFF4CAF50),
            value: 40, //formatPercentageToDouble(model?.ongoing),
            title: '50%', //model?.ongoing,
            titleStyle: titleStyle,
          );
        case 2:
          return PieChartSectionData(
            radius: radius,
            color: const Color(0xFFFFC107),
            value: 20, //formatPercentageToDouble(model?.completed),
            title: '20%', //model?.completed,
            titleStyle: titleStyle,
          );
        default:
          throw Exception('Error');
      }
    });
  }

  double formatPercentageToDouble(String? percentage) {
    if (percentage == null) {
      return 0.0;
    }
    String cleanedPercentage = percentage.replaceAll('%', '').trim();

    return double.tryParse(cleanedPercentage) ?? 0.0;
  }
}

class _PieChartColorInfo extends StatelessWidget {
  const _PieChartColorInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3),
              ),
            ),
            10.horizontalSpace,
            Text(
              context.l10n.incomingBookings,
              style: context.theme.textTheme.displaySmall?.copyWith(
                fontSize: 12.sp,
                color: const Color(0xFF87878A),
              ),
            )
          ],
        ),
        10.verticalSpace,
        Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
              ),
            ),
            10.horizontalSpace,
            Text(
              context.l10n.ongoingBookings,
              style: context.theme.textTheme.displaySmall?.copyWith(
                fontSize: 12.sp,
                color: const Color(0xFF87878A),
              ),
            )
          ],
        ),
        10.verticalSpace,
        Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC107),
              ),
            ),
            10.horizontalSpace,
            Text(
              context.l10n.completedBookings,
              style: context.theme.textTheme.displaySmall?.copyWith(
                fontSize: 12.sp,
                color: const Color(0xFF87878A),
              ),
            )
          ],
        )
      ],
    );
  }
}
