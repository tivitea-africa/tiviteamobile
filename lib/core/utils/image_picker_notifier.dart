import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/core/utils/image_picker_util.dart';

part 'image_picker_notifier.g.dart';

@riverpod
class ImagePickerNotifier extends _$ImagePickerNotifier {
  @override
  List<XFile> build() => [];

  void selectImages() async {
    final results = await ImagePickerUtil.pickImages();
    state = results;
  }

  void deleteImage(String imagePath) {
    state = state.where((path) => path.path != imagePath).toList();
  }
}
