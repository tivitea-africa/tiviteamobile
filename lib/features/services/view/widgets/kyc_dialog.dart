import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';
import 'package:tivi_tea/repositories/user/user_repo_impl.dart';

class KYCDialog extends StatelessWidget {
  const KYCDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          AppSvgWidget(path: Assets.svgs.greenBox),
          20.verticalSpace,
          Text(
            context.l10n.completeKYC,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontSize: 20.sp,
            ),
          ),
          20.verticalSpace,
          Text(
            context.l10n.toContinueBooking,
            textAlign: TextAlign.center,
          ),
          30.verticalSpace,
          Consumer(
            builder: (context, ref, _) {
              final userEntityType =
                  ref.watch(currentUserProvider).entityType ??
                      EntityType.partner;
              return AppButton(
                buttonText: context.l10n.startKYCProcess,
                onPressed: () => _navigateToStartKYCView(
                  context,
                  userEntityType,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _navigateToStartKYCView(
    BuildContext context,
    EntityType userEntityType,
  ) {
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
    context.pop();
  }
}
