import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchProfileAvatarRoundCell extends StatelessWidget {
  const BranchProfileAvatarRoundCell({
    Key? key,
    required this.isSelected,
    required this.imagePath,
  }) : super(key: key);

  final AppColoredFile imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
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
                          .read<BranchProfileAvatarPictureCubit>()
                          .selectImage(imagePath);
                    },
                    child: Ink(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
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
                    border: Border.all(color: valencia),
                    color: valencia.withOpacity(0.3),
                    shape: BoxShape.circle,
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
