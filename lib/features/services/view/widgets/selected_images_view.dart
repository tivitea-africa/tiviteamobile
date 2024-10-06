import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/image_picker_util.dart';
import 'package:tivi_tea/features/home/view/service_provider/service_provider_dashboard.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';

class SelectedImagesView extends StatefulWidget {
  const SelectedImagesView({super.key});

  @override
  State<SelectedImagesView> createState() => _SelectedImagesViewState();
}

class _SelectedImagesViewState extends State<SelectedImagesView> {
  List<XFile> _selectedImages = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _selectedImages.isEmpty
            ? const Center(child: Text('No images selected.'))
            : GridView.builder(
                shrinkWrap: true,
                itemCount: _selectedImages.length,
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
                            File(_selectedImages[index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: _DeleteIcon(
                          deleteImage: () => _deleteImage(index),
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
    _selectedImages = [
      ..._selectedImages,
      ...await ImagePickerUtil.pickImages()
    ];
    setState(() {});
  }

  void _deleteImage(int index) {
    _selectedImages.removeAt(index);
    setState(() {});
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
