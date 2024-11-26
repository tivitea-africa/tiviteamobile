import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_appbar.dart';
import 'package:tivi_tea/features/registration/view/widgets/registration_scaffold.dart';
import 'package:tivi_tea/features/services/view/pages/booking_summary_view.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class EReceiptView extends StatelessWidget {
  const EReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      appbar: RegistrationAppBar(
        headerSectionTitle: context.l10n.eReceipt,
        headerSectionSubtitle: context.l10n.downloadEReceiptHere,
      ),
      body: const Column(
        children: [
          _PaymentReceiptView()
        ],
      ),
    );
  }
}

class _PaymentReceiptView extends StatelessWidget {
  const _PaymentReceiptView();

  @override
  Widget build(BuildContext context) {
    return DottedWidget(
      child: Column(
        children: [
          Container(
            width: context.width,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                AppSvgWidget(path: Assets.images.appLogo.path),
                20.horizontalSpace,
                Text(
                  context.l10n.paymentReceipt,
                  style: context.theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            width: context.width,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                AppSvgWidget(path: Assets.images.appLogo.path),
                20.horizontalSpace,
                Text(
                  context.l10n.paymentReceipt,
                  style: context.theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
