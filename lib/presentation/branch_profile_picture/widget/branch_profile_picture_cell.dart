import 'dart:typed_data';

import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_page.dart';
import 'package:business_terminal/presentation/common/widgets/dynamic_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: DynamicImage(
                    path: imagePath,
                    fit: BoxFit.cover,
                  ),
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

  Widget generateImage(dynamic path) {
    if (path is String) {
      return CachedNetworkImage(
        imageUrl: path as String,
        fit: BoxFit.cover,
      );
    }

    return Image.memory(
      path as Uint8List,
      fit: BoxFit.cover,
    );
  }
}

Future pickAndCropImage(BuildContext context) async {
  final cubit = context.read<BranchProfilePictureCubit>();
  final image = await cubit.pickImage(context);
  if (image != null) {
    cubit.loading();
    await Future.delayed(Duration(milliseconds: 50));

    final croppedImage = await Navigator.pushNamed<Uint8List>(
      context,
      CropperPage.path,
      arguments: {
        CropperPage.pHeader: AppLocale.current.edit_photo,
        CropperPage.pSubheader: AppLocale.current.edit_photo_descr,
        CropperPage.pImageForCrop: image,
        CropperPage.pCircleCrop: false,
      },
    );

    if (croppedImage != null) {
      return cubit.setImage(imageBytes: croppedImage);
    }

    return cubit.setImage(imageBytes: image);
  }

  return cubit.init();
}
