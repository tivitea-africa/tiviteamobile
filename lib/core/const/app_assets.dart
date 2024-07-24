import 'package:tivi_tea/core/const/base.dart';

/// Contains all the paths of image used across the project.
/// Every image path variable name must contain a name and its extension.
/// example :
///
/// for an image with name avatar.png,
/// a suitable variable can be [avatarImagePng].
/// ```dart
/// static const sampleImagePng = "$_base/image.png";
/// ```
/// can be used by doing
/// ```dart
/// ImageAssets.sampleImagePng
/// ```
class ImageAssets {
  static const _base = BasePaths.baseImagePath;

  static const logo = '$_base/logo.png';
  static const success = '$_base/success.png';
}

class SvgAssets {
  static const _base = BasePaths.baseSvgPath;
}

class AnimationAssets {
  /// Contains all the paths of animations used across the project.
}

class PlaceholderAssets {
  static const _base = BasePaths.basePlaceholderPath;

  static const logo = '$_base/logo.png';
  static const onbrd1 = '$_base/onboard1.png';
  static const onbrd2 = '$_base/onboard2.png';
  static const google = '$_base/google.png';
  static const pfp = '$_base/pfp.png';
  static const home1 = '$_base/jobHunt.png';
  static const home2 = '$_base/jobHunt2.png';
  static const image1 = '$_base/image1.png';
  static const image2 = '$_base/image2.png';
  static const image3 = '$_base/image3.png';
}

class IconAssets {
  static const _base = BasePaths.baseIconPath;
}
