import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/image_picker_notifier.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
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
            color: const Color(0xFFE8E8EB).withOpacity(0.3),
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
            _BottomSheetWidget(
              chooseFileType: ChooseFileType.takePhoto,
              onImageSelected: onImageSelected,
            ),
            20.horizontalSpace,
            _BottomSheetWidget(
              chooseFileType: ChooseFileType.selectFromGallery,
              onImageSelected: onImageSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetWidget extends ConsumerWidget {
  final ChooseFileType chooseFileType;
  final Function(XFile) onImageSelected;
  const _BottomSheetWidget({
    required this.chooseFileType,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _onTap(chooseFileType, ref),
      child: DottedWidget(
        radius: 8.sp,
        child: Container(
          width: 135.w,
          height: 135.h,
          decoration: BoxDecoration(
            color: const Color(0xFFCCCCDC).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSvgWidget(
                path: switch (chooseFileType) {
                  ChooseFileType.takePhoto => Assets.svgs.camera,
                  _ => Assets.svgs.addPhoto,
                },
              ),
              20.verticalSpace,
              Text(
                switch (chooseFileType) {
                  ChooseFileType.takePhoto => context.l10n.takeAPicture,
                  _ => context.l10n.gallery,
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(ChooseFileType fileType, WidgetRef ref) async {
    final notifier = ref.read(imagePickerNotifierProvider.notifier);
    switch (fileType) {
      case ChooseFileType.takePhoto:
        final image = await notifier.selectSingleImage(
          source: ImageSource.camera,
        );
        if (image == null) return;
        onImageSelected(image);
        break;

      default:
        final image = await notifier.selectSingleImage();
        if (image == null) return;
        onImageSelected(image);
    }
  }
}

enum ChooseFileType { takePhoto, selectFromGallery, selectFromFiles }
