import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_appbar.dart';
import 'package:tivi_tea/features/common/app_scaffold.dart';
import 'package:tivi_tea/features/home/view/widgets/booking_summary.dart';
import 'package:tivi_tea/features/home/view/widgets/dashboard_grid.dart';
import 'package:tivi_tea/features/home/view/widgets/financial_summary.dart';
import 'package:tivi_tea/features/home/view/widgets/welcome_back_text.dart';
import 'package:tivi_tea/features/home/view_model/dashboard_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ServiceProviderDashboard extends ConsumerStatefulWidget {
  const ServiceProviderDashboard({super.key});

  @override
  ConsumerState<ServiceProviderDashboard> createState() =>
      _ServiceProviderDashboardState();
}

class _ServiceProviderDashboardState
    extends ConsumerState<ServiceProviderDashboard> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(dashboardNotiferProvider.notifier);
    notifier.getServiceProviderDashboardDetails();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const CustomAppBar(showHamburgerMenu: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeBackText(dashboard: true),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CreateListingButton(
                    text: context.l10n.addAccountDetails,
                    hasWhiteBackground: true,
                  ),
                  10.horizontalSpace,
                  CreateListingButton(
                    text: context.l10n.createListing,
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
            20.verticalSpace,
            const DashboardGrid(),
            20.verticalSpace,
            const BookingSummarySection(),
            20.verticalSpace,
            const FinancialSummary(),
          ],
        ),
      ),
    );
  }
}

class CreateListingButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool hasWhiteBackground;
  final String text;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  const CreateListingButton({
    super.key,
    required this.text,
    this.hasWhiteBackground = false,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: backgroundColor ?? context.theme.primaryColor,
          ),
          borderRadius: BorderRadius.circular(22),
          color: backgroundColor ??
              (hasWhiteBackground ? Colors.white : context.theme.primaryColor),
        ),
        child: Row(
          children: [
            Icon(
              Icons.add_rounded,
              color: iconColor ??
                  (hasWhiteBackground
                      ? context.theme.primaryColor
                      : Colors.white),
            ),
            5.horizontalSpace,
            Text(
              text,
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontSize: 12.sp,
                color: textColor ??
                    (hasWhiteBackground
                        ? context.theme.primaryColor
                        : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
