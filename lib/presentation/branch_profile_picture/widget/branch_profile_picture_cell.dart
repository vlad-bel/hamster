import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_page.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchProfilePictureCell extends StatelessWidget {
  const BranchProfilePictureCell({
    Key? key,
    required this.isSelected,
    required this.imagePath,
  }) : super(key: key);

  final AppColoredFile imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: AppImageWidget(
                    appFile: imagePath,
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
                      decoration: const BoxDecoration(
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
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
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
}

Future pickAndCropImage(
  BuildContext context,
) async {
  final cubit = context.read<BranchProfilePictureCubit>();
  final image = await cubit.pickImage(context);
  if (image != null) {
    if (image.size != null && image.size! >= 100000000) {
      SnackBarManager.showError(
        'Das Bild sollte das Format PNG, JPEG, SVG, BMP haben und nicht größer als 10Mb sein',
      );
      return;
    }

    cubit.loading();
    await Future.delayed(const Duration(milliseconds: 200));

    final croppedImage = await Navigator.pushNamed<AppFile>(
      context,
      CropperPage.path,
      arguments: {
        CropperPage.pHeader: AppLocale.current.edit_photo,
        CropperPage.pSubheader: AppLocale.current.edit_photo_descr,
        CropperPage.pImageForCrop: image.bytes,
        CropperPage.pCircleCrop: false,
      },
    );

    if (croppedImage != null) {
      final appFile = AppColoredFile(
        name: null,
        bytes: croppedImage.bytes,
        color: null,
        extension: 'png',
      );

      return cubit.setImage(appFile: appFile);
    }

    return cubit.setImage(appFile: image);
  }

  return cubit.init();
}
