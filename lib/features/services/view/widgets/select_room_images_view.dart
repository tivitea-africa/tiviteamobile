import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/features/services/view/widgets/delete_icon.dart';
import 'package:tivi_tea/features/services/view_model/room_image_selector_notifier.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SelectedRoomImagesView extends ConsumerStatefulWidget {
  const SelectedRoomImagesView({super.key});

  @override
  ConsumerState<SelectedRoomImagesView> createState() =>
      _SelectedRoomImagesViewState();
}

class _SelectedRoomImagesViewState
    extends ConsumerState<SelectedRoomImagesView> {
  @override
  Widget build(BuildContext context) {
    final selectedImages = ref.watch(roomImageSelectorNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.uploadImagesOf('Room'),
          style: context.theme.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryColor,
            fontSize: 20.sp,
          ),
        ),
        20.verticalSpace,
        selectedImages.isEmpty
            ? const Center(
                child: Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text('No images selected.'),
              ))
            : GridView.builder(
                shrinkWrap: true,
                itemCount: selectedImages.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: SizedBox(
                          height: 160.h,
                          width: context.width,
                          child: Image.file(
                            File(selectedImages[index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: DeleteIcon(
                          deleteImage: () => _deleteImage(
                            selectedImages[index].path,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
        10.verticalSpace,
        InkWell(
          onTap: _pickImages,
          child: Row(
            children: [
              Icon(Icons.add_rounded, color: context.theme.primaryColor),
              5.horizontalSpace,
              Text(
                context.l10n.addImage,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontSize: 12.sp,
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _pickImages() async {
    final notifier = ref.read(roomImageSelectorNotifierProvider.notifier);
    notifier.selectImages();
  }

  void _deleteImage(String imagePath) {
    final notifier = ref.read(roomImageSelectorNotifierProvider.notifier);
    notifier.deleteImage(imagePath);
  }
}
