import 'package:flutter/material.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';

class DeleteIcon extends StatelessWidget {
  final VoidCallback deleteImage;
  const DeleteIcon({super.key, required this.deleteImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: deleteImage,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: context.theme.primaryColor.withValues(alpha: 0.7),
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