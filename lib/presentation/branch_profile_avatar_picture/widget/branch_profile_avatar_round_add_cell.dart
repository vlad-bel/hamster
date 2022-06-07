import 'dart:typed_data';

import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchProfileAvatarRoundAddCell extends StatelessWidget {
  const BranchProfileAvatarRoundAddCell({
    Key? key,
    this.dashPattertn = const [7, 7],
  }) : super(key: key);

  final List<double> dashPattertn;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: DottedBorder(
              dashPattern: dashPattertn,
              color: lynch.withOpacity(0.3),
              borderType: BorderType.Circle,
              strokeWidth: 1.2,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: denim.withOpacity(0.1),
                    ),
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
        ),
      ),
    );
  }

  Future pickAndCropImage(BuildContext context) async {
    final cubit = context.read<BranchProfileAvatarPictureCubit>();
    final image = await cubit.pickImage(context);
    if (image != null) {
      cubit.loading();
      await Future.delayed(Duration(milliseconds: 200));

      final croppedImage = await Navigator.pushNamed<Uint8List>(
        context,
        CropperPage.path,
        arguments: {
          CropperPage.pHeader: AppLocale.current.edit_photo,
          CropperPage.pSubheader: AppLocale.current.edit_photo_descr,
          CropperPage.pImageForCrop: image.bytes,
          CropperPage.pCircleCrop: true,
        },
      );

      if (croppedImage != null) {
        final appFile = AppFile(
          size: image.size,
          extension: image.extension,
          name: image.name,
          bytes: croppedImage,
        );

        return cubit.setImage(appFile: appFile);
      }

      return cubit.setImage(appFile: image);
    }

    return cubit.init();
  }
}
