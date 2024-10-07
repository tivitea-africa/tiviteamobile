import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/image_picker_notifier.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SelectedImagesView extends ConsumerStatefulWidget {
  const SelectedImagesView({super.key});

  @override
  ConsumerState<SelectedImagesView> createState() => _SelectedImagesViewState();
}

class _SelectedImagesViewState extends ConsumerState<SelectedImagesView> {
  @override
  Widget build(BuildContext context) {
    final selectedImages = ref.watch(imagePickerNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectedImages.isEmpty
            ? const Center(child: Text('No images selected.'))
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
                        child: _DeleteIcon(
                          deleteImage: () => _deleteImage(selectedImages[index].path),
                        ),
                      ),
                    ],
                  );
                },
              ),
        10.verticalSpace,
        IntrinsicWidth(
          child: CreateListingButton(
            text: context.l10n.addImage,
            iconColor: Colors.black,
            textColor: Colors.black,
            backgroundColor: const Color(0xFFE8E8EB),
            onTap: _pickImages,
          ),
        )
      ],
    );
  }

  void _pickImages() async {
    final notifier = ref.read(imagePickerNotifierProvider.notifier);
    notifier.selectImages();
  }

  void _deleteImage(String imagePath) {
    final notifier = ref.read(imagePickerNotifierProvider.notifier);
    notifier.deleteImage(imagePath);
  }
}

class _DeleteIcon extends StatelessWidget {
  final VoidCallback deleteImage;
  const _DeleteIcon({required this.deleteImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: deleteImage,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: context.theme.primaryColor.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }
}
