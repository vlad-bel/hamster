import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_picture_add_cell.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_picture_cell.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_selected_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/dashed_button/rect_dashed_button.dart';

class BranchProfilePictureSelector extends StatelessWidget {
  const BranchProfilePictureSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchProfilePictureCubit, BranchProfilePictureState>(
      builder: (context, state) {
        final loader = state.when(
          loading: (_, __) => SizedBox(
            height: 150,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          init: (_, __) => SizedBox(),
        );

        if (state.images != null && state.selectedImage != null) {
          return Column(
            children: [
              Stack(
                children: [
                  SelectedPicture(
                    path: state.selectedImage,
                  ),
                  loader,
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: generatePhotoCells(
                  state.images!,
                  state.selectedImage,
                ),
              ),
            ],
          );
        }
        return Stack(
          children: [
            SizedBox(
              width: 350,
              height: 150,
              child: RectDashedButton(
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

  List<Widget> generatePhotoCells(
    List<dynamic> imagePaths,
    dynamic selectedImage,
  ) {
    final cells = <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 3.0),
        child: BranchProfileAddCell(),
      )
    ];

    for (final imagePath in imagePaths) {
      cells.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: BranchProfilePictureCell(
            isSelected: imagePath == selectedImage,
            imagePath: imagePath,
          ),
        ),
      );
    }

    return cells;
  }
}
