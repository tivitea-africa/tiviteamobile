import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tivi_tea/core/utils/logger.dart';

class ImagePickerUtil {
  //This permission function should be extracted into it's own service class in the future.
  static Future<bool> _requestPermission() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          return true;
        }
      }
      
      final Permission permission =
          Platform.isAndroid ? Permission.storage : Permission.photos;

      if (await permission.status == PermissionStatus.granted) {
        return true;
      } else if (await permission.status == PermissionStatus.denied) {
        PermissionStatus newStatus = await permission.request();
        if (newStatus.isDenied || newStatus.isPermanentlyDenied) {
          await openAppSettings();
        } else {
          return true;
        }
      } else if (await permission.status == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
        return false;
      }
      return false;
    } catch (e) {
      debugLog("Permission request error => ${e.toString()}");
      return false;
    }
  }

  static Future<XFile?> pickSingleImage(ImageSource imageSource) async {
    bool permissionGranted = await _requestPermission();

    try {
      if (!permissionGranted) {
        throw Exception('Permission not granted to access media.');
      }
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: imageSource);

      return image;
    } catch (e) {
      debugLog("Pick Image error => ${e.toString()}");
      return null;
    }
  }

  static Future<List<XFile>> pickImages(ImageSource imageSource) async {
    bool permissionGranted = await _requestPermission();

    try {
      if (!permissionGranted) {
        throw Exception('Permission not granted to access media.');
      }
      final ImagePicker picker = ImagePicker();

      if (imageSource == ImageSource.camera) {
        XFile? image = await picker.pickImage(source: imageSource);
        return image == null ? [] : [image];
      }
      List<XFile> images = await picker.pickMultiImage();
      return images;
    } catch (e) {
      debugLog("Pick Multi-Image error => ${e.toString()}");
      return [];
    }
  }
}
