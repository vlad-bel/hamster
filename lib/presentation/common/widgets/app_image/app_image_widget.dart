import 'dart:typed_data';

import 'package:business_terminal/config/image/image_paths.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppImageWidget extends StatelessWidget {
  const AppImageWidget({
    Key? key,
    required this.appFile,
    required this.fit,
  }) : super(key: key);

  final AppFile appFile;
  final BoxFit fit;

  Future<Uint8List> readNetworkImage(String imageUrl) async {
    final data = await NetworkAssetBundle(
      Uri.parse(imageUrl),
    ).load(
      imageUrl,
    );
    final bytes = data.buffer.asUint8List();
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    if (appFile.bytes != null) {
      return Image.memory(
        appFile.bytes!,
        filterQuality: FilterQuality.none,
        fit: fit,
      );
    }

    if (appFile.name != null) {
      return AppNetworkImageWidget(
        fileName: appFile.name!,
      );
    }
    return SvgPicture.asset(
      ImagePaths.svgLogo(
        SvgPaths.brandLogoDenim,
      ),
    );
  }
}
