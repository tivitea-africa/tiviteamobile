import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/data_type_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/history/model/booking_history_model.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';

class HistoryDetailView extends ConsumerWidget {
  final BookingHistoryModel booking;
  const HistoryDetailView({super.key, required this.booking});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entityType = ref.read(userNotifierProvider).entityType;
    return AppScaffold(
      appbar: CustomAppBar(
        title: context.l10n.bookingHistoryView,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 15) +
              const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD8D8DD),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              if (entityType == EntityType.partner) ...[
                50.verticalSpace,
                Text(
                  'Service Completed',
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: AppButton(
                    backgroundColor: Colors.white,
                    borderColor: context.theme.primaryColor,
                    textColor: context.theme.primaryColor,
                    buttonText: 'Scan QR Code',
                    onPressed: () {},
                  ),
                ),
              ]
            ],
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
