import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class HistoryDetailView extends StatelessWidget {
  final BookingHistoryModel booking;
  const HistoryDetailView({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.bookingHistoryView,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 15) + const EdgeInsets.only(top: 20, bottom: 100),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD8D8DD),
            ),
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                _buildRow(
                  context,
                  title: context.l10n.customer,
                  value:
                      '${booking.client?.user?.firstName ?? ''} ${booking.client?.user?.lastName ?? ''}',
                ),
                20.verticalSpace,
                _buildRow(
                  context,
                  title: context.l10n.status,
                  value: booking.status ?? '',
                ),
                20.verticalSpace,
                _buildRow(
                  context,
                  title: 'Service',
                  value: booking.listing?.listingType ?? '',
                ),
                20.verticalSpace,
                _buildRow(
                  context,
                  title: 'Amount',
                  value: (booking.listing?.amount ?? 0).formatAmount,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    final amount = double.tryParse(value);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.theme.textTheme.displaySmall),
        amount == null
            ? Text(
                value,
                style: context.theme.textTheme.displaySmall?.copyWith(
                  color: Colors.grey,
                ),
              )
            : amount.getCurrencyText(),
      ],
    );
  }
}
