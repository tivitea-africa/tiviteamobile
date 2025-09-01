import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/utils/image_picker_notifier.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/kyc/model/enums.dart';
import 'package:tivi_tea/features/services/view/pages/booking_summary_view.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class BottomSheetWidget extends ConsumerWidget {
  final ChooseFileType chooseFileType;
  final Function(XFile) onImageSelected;
  const BottomSheetWidget({
    super.key,
    required this.chooseFileType,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _onTap(chooseFileType, ref, context),
      child: DottedWidget(
        radius: 8.sp,
        child: Container(
          width: 135.w,
          height: 135.h,
          decoration: BoxDecoration(
            color: const Color(0xFFCCCCDC).withValues(alpha: 0.1),
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

  void _onTap(
    ChooseFileType fileType,
    WidgetRef ref,
    BuildContext context,
  ) async {
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

    if (context.mounted) {
      context.pop();
    }
  }
}
