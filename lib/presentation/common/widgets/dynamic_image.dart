import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DynamicBranchImage extends StatelessWidget {
  const DynamicBranchImage({
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
    final pictureModel = path as AppFile;
    return Image.memory(
      pictureModel.bytes!,
      filterQuality: FilterQuality.none,
      fit: fit,
    );
  }
}
