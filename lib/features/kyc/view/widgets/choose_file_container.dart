import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/services/view/pages/booking_summary_view.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ChooseFileContainer extends StatelessWidget {
  final String? title;
  const ChooseFileContainer({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return DottedWidget(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8EB).withOpacity(0.3),
        ),
        child: Column(
          children: [
            AppSvgWidget(path: Assets.svgs.cloudUpload),
            Text(
              title ?? context.l10n.businessRegistrationDocument,
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontSize: 12.sp,
              ),
            ),
            Text(
              context.l10n.uploadScanned,
              style: context.theme.textTheme.displaySmall?.copyWith(
                fontSize: 10.sp,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: context.theme.primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                context.l10n.chooseAFile,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
