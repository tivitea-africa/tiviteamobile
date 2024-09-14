/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/onboarding_slide_1.png
  AssetGenImage get onboardingSlide1 =>
      const AssetGenImage('assets/images/onboarding_slide_1.png');

  /// File path: assets/images/onboarding_slide_2.png
  AssetGenImage get onboardingSlide2 =>
      const AssetGenImage('assets/images/onboarding_slide_2.png');

  /// File path: assets/images/onboarding_slide_3.png
  AssetGenImage get onboardingSlide3 =>
      const AssetGenImage('assets/images/onboarding_slide_3.png');

  /// File path: assets/images/onboarding_slide_4.png
  AssetGenImage get onboardingSlide4 =>
      const AssetGenImage('assets/images/onboarding_slide_4.png');

  /// File path: assets/images/scaffold-arc.png
  AssetGenImage get scaffoldArc =>
      const AssetGenImage('assets/images/scaffold-arc.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appLogo,
        google,
        onboardingSlide1,
        onboardingSlide2,
        onboardingSlide3,
        onboardingSlide4,
        scaffoldArc
      ];
}

class $AssetsPlaceholdersGen {
  const $AssetsPlaceholdersGen();

  /// File path: assets/placeholders/Avatars.png
  AssetGenImage get avatars =>
      const AssetGenImage('assets/placeholders/Avatars.png');

  /// File path: assets/placeholders/draft.png
  AssetGenImage get draft =>
      const AssetGenImage('assets/placeholders/draft.png');

  /// File path: assets/placeholders/google.png
  AssetGenImage get google =>
      const AssetGenImage('assets/placeholders/google.png');

  /// File path: assets/placeholders/image1.png
  AssetGenImage get image1 =>
      const AssetGenImage('assets/placeholders/image1.png');

  /// File path: assets/placeholders/image2.png
  AssetGenImage get image2 =>
      const AssetGenImage('assets/placeholders/image2.png');

  /// File path: assets/placeholders/image3.png
  AssetGenImage get image3 =>
      const AssetGenImage('assets/placeholders/image3.png');

  /// File path: assets/placeholders/jobHunt.png
  AssetGenImage get jobHunt =>
      const AssetGenImage('assets/placeholders/jobHunt.png');

  /// File path: assets/placeholders/jobHunt2.png
  AssetGenImage get jobHunt2 =>
      const AssetGenImage('assets/placeholders/jobHunt2.png');

  /// File path: assets/placeholders/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/placeholders/logo.png');

  /// File path: assets/placeholders/o1.png
  AssetGenImage get o1 => const AssetGenImage('assets/placeholders/o1.png');

  /// File path: assets/placeholders/o2.png
  AssetGenImage get o2 => const AssetGenImage('assets/placeholders/o2.png');

  /// File path: assets/placeholders/o3.png
  AssetGenImage get o3 => const AssetGenImage('assets/placeholders/o3.png');

  /// File path: assets/placeholders/o4.png
  AssetGenImage get o4 => const AssetGenImage('assets/placeholders/o4.png');

  /// File path: assets/placeholders/onboard1.png
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/placeholders/onboard1.png');

  /// File path: assets/placeholders/onboard2.png
  AssetGenImage get onboard2 =>
      const AssetGenImage('assets/placeholders/onboard2.png');

  /// File path: assets/placeholders/pfp.png
  AssetGenImage get pfp => const AssetGenImage('assets/placeholders/pfp.png');

  /// File path: assets/placeholders/published.png
  AssetGenImage get published =>
      const AssetGenImage('assets/placeholders/published.png');

  /// File path: assets/placeholders/space1.png
  AssetGenImage get space1 =>
      const AssetGenImage('assets/placeholders/space1.png');

  /// File path: assets/placeholders/space2.png
  AssetGenImage get space2 =>
      const AssetGenImage('assets/placeholders/space2.png');

  /// File path: assets/placeholders/space3.png
  AssetGenImage get space3 =>
      const AssetGenImage('assets/placeholders/space3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatars,
        draft,
        google,
        image1,
        image2,
        image3,
        jobHunt,
        jobHunt2,
        logo,
        o1,
        o2,
        o3,
        o4,
        onboard1,
        onboard2,
        pfp,
        published,
        space1,
        space2,
        space3
      ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/back_button.svg
  String get backButton => 'assets/svgs/back_button.svg';

  /// File path: assets/svgs/envelope.svg
  String get envelope => 'assets/svgs/envelope.svg';

  /// File path: assets/svgs/eye.svg
  String get eye => 'assets/svgs/eye.svg';

  /// File path: assets/svgs/eye_slash.svg
  String get eyeSlash => 'assets/svgs/eye_slash.svg';

  /// File path: assets/svgs/green-check.svg
  String get greenCheck => 'assets/svgs/green-check.svg';

  /// File path: assets/svgs/profile_icon.svg
  String get profileIcon => 'assets/svgs/profile_icon.svg';

  /// File path: assets/svgs/suitcase.svg
  String get suitcase => 'assets/svgs/suitcase.svg';

  /// List of all assets
  List<String> get values =>
      [backButton, envelope, eye, eyeSlash, greenCheck, profileIcon, suitcase];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsPlaceholdersGen placeholders = $AssetsPlaceholdersGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
