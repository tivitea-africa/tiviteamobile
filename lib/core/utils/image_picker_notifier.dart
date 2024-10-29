import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/utils/image_picker_util.dart';

part 'image_picker_notifier.g.dart';

@riverpod
class ImagePickerNotifier extends _$ImagePickerNotifier {
  @override
  List<XFile> build() => [];

  Future<XFile?> selectSingleImage({ImageSource source = ImageSource.gallery}) async {
    final result = await ImagePickerUtil.pickSingleImage(source);
    if (result == null) return null;
    return result;
  }

  void selectImages({ImageSource source = ImageSource.gallery}) async {
    final results = await ImagePickerUtil.pickImages(source);
    state = results;
  }

  void deleteImage(String imagePath) {
    state = state.where((path) => path.path != imagePath).toList();
  }
}
