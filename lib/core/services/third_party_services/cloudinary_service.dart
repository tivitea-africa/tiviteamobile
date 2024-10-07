import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tivi_tea/core/utils/logger.dart';

class CloudinaryService {
  final CloudinaryPublic cloudinary;

  CloudinaryService({required this.cloudinary});

  Future<List<String>> uploadImages(List<XFile> filePaths) async {
    List<String> uploadedImageUrls = [];

    List<Future<void>> uploadTasks = filePaths.map((XFile filePath) async {
      File file = File(filePath.path);
      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(file.path),
        );
        if (response.secureUrl.isNotEmpty) {
          uploadedImageUrls.add(response.secureUrl);
        }
        debugLog('Uploaded image URL: ${response.secureUrl}');
      } catch (e) {
        debugLog('Error uploading image: $e');
      }
    }).toList();

    await Future.wait(uploadTasks);

    return uploadedImageUrls;
  }
}
