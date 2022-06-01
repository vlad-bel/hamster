import 'dart:typed_data';

import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/widget/avatar_selected_picture.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/widget/branch_profile_avatar_round_add_cell.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/widget/branch_profile_avatar_round_cell.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_page.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/circle_dashed_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileAvatarPictureSelector extends StatelessWidget {
  const BranchProfileAvatarPictureSelector({
    Key? key,
    required this.showAddButton,
    required this.showEditButton,
  }) : super(key: key);

  final bool showAddButton;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchProfileAvatarPictureCubit,
        BranchProfileAvatarPictureState>(
      builder: (context, state) {
        final loader = state.when(
          loading: (_, __) => SizedBox(
            height: 220,
            width: 220,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          init: (_, __) => const SizedBox(),
        );
        if (state.images != null && state.selectedImage != null) {
          return Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AvatarSelectedPicture(
                    path: state.selectedImage,
                    showEditButton: showEditButton,
                  ),
                  loader,
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: _generatePhotoCells(
                  state.images!,
                  state.selectedImage,
                ),
              ),
            ],
          );
        }
        return Stack(
          children: [
            Container(
              width: 220,
              height: 220,
              child: CircleDashedButton(
                label: AppLocale.current.add_branch_picture,
                onTap: () {
                  pickAndCropImage(context);
                },
              ),
            ),
            loader,
          ],
        );
      },
    );
  }

  List<Widget> _generatePhotoCells(
    List<dynamic> imagePaths,
    dynamic selectedImage,
  ) {
    final cells = <Widget>[
      if (showAddButton)
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: BranchProfileAvatarRoundAddCell(),
        )
    ];

    for (final imagePath in imagePaths) {
      cells.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: BranchProfileAvatarRoundCell(
            isSelected: imagePath == selectedImage,
            imagePath: imagePath,
          ),
        ),
      );
    }

    return cells;
  }

  Future pickAndCropImage(BuildContext context) async {
    final cubit = context.read<BranchProfileAvatarPictureCubit>();
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
          CropperPage.pCircleCrop: true,
        },
      );

      if (croppedImage != null) {
        return cubit.setImage(imageBytes: croppedImage);
      }

      return cubit.setImage(imageBytes: image);
    }

    return cubit.init();
  }
}
