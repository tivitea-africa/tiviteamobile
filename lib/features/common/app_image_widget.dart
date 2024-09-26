import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class AppImageWidget extends StatelessWidget {
  const AppImageWidget({
    super.key,
    required this.imagePath,
    this.fit,
    this.borderRadius,
  });

  final String imagePath;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius; 

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error) => _NoImage(),
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}

class _NoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('No Image data available');

    ///TODO: Add to [l10n]
  }
}
