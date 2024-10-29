import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerUtil {
  //This permission function should be extracted into it's own service class in the future.
  static Future<bool> _requestPermission() async {
    PermissionStatus status = await Permission.photos.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      PermissionStatus newStatus = await Permission.photos.request();
      return newStatus.isGranted;
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return false;
  }

  static Future<XFile?> pickSingleImage(ImageSource imageSource) async {
    bool permissionGranted = await _requestPermission();

    if (!permissionGranted) {
      throw Exception('Permission not granted to access media.');
    }
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: imageSource);
    
    return image;
  }

  static Future<List<XFile>> pickImages(ImageSource imageSource) async {
    bool permissionGranted = await _requestPermission();

    if (!permissionGranted) {
      // Handle the permission denied case (e.g., show a snackbar or dialog)
      throw Exception('Permission not granted to access media.');
    }
    final ImagePicker picker = ImagePicker();

    if (imageSource == ImageSource.camera) {
      XFile? image = await picker.pickImage(source: imageSource);
      return image == null ? [] : [image];
    }
    List<XFile> images = await picker.pickMultiImage();
    return images;
  }
}
