import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/kyc/view_model/client/client_kyc_notifier.dart';
import 'package:tivi_tea/features/kyc/view_model/partner/partner_kyc_notifier.dart';
import 'package:tivi_tea/features/services/view_model/service_provider/partner_services_notifier.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SubmitDocumentView extends ConsumerWidget {
  final VoidCallback submitDocs;
  const SubmitDocumentView({
    super.key,
    required this.submitDocs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: IntrinsicHeight(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              AppSvgWidget(path: Assets.svgs.pendingVerification),
              20.verticalSpace,
              Text(
                context.l10n.accountVerification,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              20.verticalSpace,
              Text(
                context.l10n.twoBusinessDays,
                textAlign: TextAlign.center,
              ),
              50.verticalSpace,
              Consumer(
                builder: (context, ref, _) {
                  final loadState = ref.watch(
                    clientKycNotifierProvider.select(
                      (value) => value.kycLoadState,
                    ),
                  );
                  final partnerKYCLoadState = ref.watch(
                    partnerKycNotifierProvider.select(
                      (value) => value.kycLoadState,
                    ),
                  );
                  final imageUploadState = ref.watch(
                    partnerServicesNotiferProvider.select(
                      (value) => value.cloudinaryUploadState,
                    ),
                  );
                  final isloading = loadState == LoadState.loading ||
                      partnerKYCLoadState == LoadState.loading ||
                      imageUploadState == LoadState.loading;
                  return AppButton(
                    buttonText: context.l10n.submitDocuments,
                    isLoading: isloading,
                    onPressed: submitDocs,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
