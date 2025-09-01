import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/kyc/view/widgets/bottom_sheet_widget.dart';
import 'package:tivi_tea/features/services/view/pages/booking_summary_view.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class ChooseFileContainer extends StatelessWidget {
  final String? title;
  final Function(XFile) onImageSelected;
  const ChooseFileContainer({
    super.key,
    this.title,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      child: DottedWidget(
        radius: 5,
        child: Container(
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: const Color(0xFFE8E8EB).withValues(alpha: 0.3),
          ),
          child: Column(
            children: [
              AppSvgWidget(path: Assets.svgs.cloudUpload),
              10.verticalSpace,
              Text(
                title ?? context.l10n.businessRegistrationDocument,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontSize: 12.sp,
                ),
              ),
              10.verticalSpace,
              Text(
                context.l10n.uploadScanned,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displaySmall?.copyWith(
                  fontSize: 10.sp,
                ),
              ),
              20.verticalSpace,
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: context.theme.primaryColor,
                    width: 2,
                  ),
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
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    context.showBottomSheet(
      title: context.l10n.uploadDocument,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomSheetWidget(
              chooseFileType: ChooseFileType.takePhoto,
              onImageSelected: onImageSelected,
            ),
            20.horizontalSpace,
            BottomSheetWidget(
              chooseFileType: ChooseFileType.selectFromGallery,
              onImageSelected: onImageSelected,
            ),
          ],
        ),
      ),
    );
  }
}
