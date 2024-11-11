import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class DocumentSubmitted extends ConsumerWidget {
  const DocumentSubmitted({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.proofOfIdentity,
        headerSectionSubtitle: context.l10n.provideInfo,
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              children: [
                20.verticalSpace,
                AppSvgWidget(path: Assets.svgs.greenCheck),
                20.verticalSpace,
                Text(
                  context.l10n.documentSubmitted,
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                20.verticalSpace,
                Text(
                  context.l10n.afterTwoBusinessDays,
                  textAlign: TextAlign.center,
                ),
                80.verticalSpace,
                AppButton(
                  buttonText: context.l10n.goToDashboard,
                  onPressed: () => context.go(AppRoutes.homeView),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
