import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DynamicImage extends StatelessWidget {
  const DynamicImage({
    Key? key,
    required this.path,
    required this.fit,
  }) : super(key: key);

  final dynamic path;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (path is String) {
      return CachedNetworkImage(
        imageUrl: path as String,
        fit: fit,
      );
    }

    ///Works slow with big size images
    ///todo need more complex research
    ///todo how to improve loading speed of big memory images
    return Image.memory(
      path as Uint8List,
      filterQuality: FilterQuality.none,
      fit: fit,
    );
  }
}
