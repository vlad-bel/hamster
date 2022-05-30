import 'dart:typed_data';

import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchProfilePictureCell extends StatelessWidget {
  const BranchProfilePictureCell({
    Key? key,
    required this.isSelected,
    required this.imagePath,
  }) : super(key: key);

  final bool isSelected;
  final dynamic imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: buildImage(imagePath),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context
                          .read<BranchProfilePictureCubit>()
                          .selectImage(imagePath);
                    },
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: valencia),
                    color: valencia.withOpacity(0.3),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.imagesCheckMark,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget buildImage(dynamic path) {
    if (path is String) {
      return CachedNetworkImage(
        imageUrl: path,
        fit: BoxFit.cover,
      );
    }

    return Image.memory(
      path as Uint8List,
      fit: BoxFit.cover,
    );
  }
}

class BranchProfileAddCell extends StatelessWidget {
  const BranchProfileAddCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        onTap: () {
          pickAndCropImage(context);
        },
        child: Ink(
          width: 50,
          height: 50,
          child: DottedBorder(
            dashPattern: [7, 7],
            color: lynch.withOpacity(0.3),
            radius: Radius.circular(4),
            strokeWidth: 1.2,
            borderType: BorderType.RRect,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                color: denim.withOpacity(0.1),
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    Assets.imagesIconPlus,
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future pickAndCropImage(BuildContext context) async {
  final cubit = context.read<BranchProfilePictureCubit>();
  final image = await cubit.pickImage(context);
  if (image != null) {
    cubit.loading();
    await Future.delayed(Duration(milliseconds: 500));

    final croppedImage = await Navigator.pushNamed<Uint8List>(
      context,
      CropperPage.path,
      arguments: {
        CropperPage.pHeader: "Bearbeiten Sie Ihr Profilfoto.",
        CropperPage.pSubheader:
            'Wählen Sie den richtigen Bereich Ihres Profilfotos aus.',
        CropperPage.pImageForCrop: image,
      },
    );


    if (croppedImage != null) {
      return cubit.setImage(imageBytes: croppedImage);
    }

    return cubit.setImage(imageBytes: image);
  }

  return cubit.init();
}
