import 'dart:io';

import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectedPicture extends StatelessWidget {
  const SelectedPicture({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 350,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            child: CachedNetworkImage(
              imageUrl: path,
              fit: BoxFit.fitWidth,
              errorWidget: (context, url, error) {
                return Image.file(File(path));
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(12, -12),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(2),
              child: EditButton(
                onEditTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
