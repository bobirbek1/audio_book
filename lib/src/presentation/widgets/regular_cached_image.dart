import 'package:audio_book/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RegularCachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  const RegularCachedImage(
      {required this.imageUrl, this.width, this.height, this.fit, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      width: width,
      height: height,
      fit: fit,
      errorWidget: (ctx, imageUrl, e) {
        return Assets.images.imagePlaceholder400x600.image(
          width: width,height: height,fit: fit,
        );
      },
      placeholder: (ctx, imageUrl) {
        return Assets.images.imagePlaceholder400x600.image(
          width: width,height: height,fit: fit,
        );
      },
    );
  }
}
