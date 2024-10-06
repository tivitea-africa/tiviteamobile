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

  static Future<List<XFile>> pickImages() async {
    bool permissionGranted = await _requestPermission();

    if (!permissionGranted) {
      // Handle the permission denied case (e.g., show a snackbar or dialog)
      throw Exception('Permission not granted to access media.');
    }
    final ImagePicker picker = ImagePicker();
    List<XFile> images = await picker.pickMultiImage();
    return images;
  }
}
