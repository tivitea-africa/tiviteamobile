import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/profile/view_model/user_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';

class KYCStatusView extends ConsumerWidget {
  const KYCStatusView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEntityType =
        ref.watch(userNotifierProvider).entityType ?? EntityType.partner;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: IntrinsicHeight(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              children: [
                20.verticalSpace,
                AppSvgWidget(path: Assets.svgs.greenBox),
                20.verticalSpace,
                Text(
                  context.l10n.completeKYC,
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                20.verticalSpace,
                Text(
                  context.l10n.ensureSecureExperience,
                  textAlign: TextAlign.center,
                ),
                80.verticalSpace,
                AppButton(
                  buttonText: context.l10n.startKYCProcess,
                  onPressed: () =>
                      _navigateToStartKYCView(context, userEntityType),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToStartKYCView(
      BuildContext context, EntityType userEntityType) {
    switch (userEntityType) {
      case EntityType.client:
        context.go(
          '${AppRoutes.servicesView}/${AppRoutes.clientKYCView}',
        );
        break;
      default:
        context.go(
          '${AppRoutes.servicesView}/${AppRoutes.partnerKYCFirstView}',
        );
    }
  }
}