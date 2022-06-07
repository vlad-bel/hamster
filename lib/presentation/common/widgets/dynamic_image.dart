import 'dart:typed_data';

import 'package:business_terminal/config/image/image_paths.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DynamicBranchImage extends StatelessWidget {
  const DynamicBranchImage({
    Key? key,
    required this.path,
    required this.fit,
  }) : super(key: key);

  final BoxFit fit;
  final dynamic path;

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
    if (path is AppFile) {
      final pictureModel = path as AppFile;
      return Image.memory(
        pictureModel.bytes!,
        filterQuality: FilterQuality.none,
        fit: fit,
      );
    }
    if (path is Uint8List) {
      final imageBytes = path as Uint8List;

      return Image.memory(
        imageBytes,
        filterQuality: FilterQuality.none,
        fit: fit,
      );
    }

    return SvgPicture.asset(
      ImagePaths.svgLogo(
        SvgPaths.brandLogoDenim,
      ),
    );
  }
}
