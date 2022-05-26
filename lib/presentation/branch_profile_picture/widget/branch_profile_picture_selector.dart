import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_picture_cell.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_selected_picture.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfilePictureSelector extends StatelessWidget {
  const BranchProfilePictureSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchProfilePictureCubit, BranchProfilePictureState>(
      builder: (context, state) {
        if (state.images != null && state.selectedImage != null) {
          return Column(
            children: [
              SelectedPicture(
                path: state.selectedImage!,
              ),
              SizedBox(height: 12),
              Row(
                children: generatePhotoCells(
                  state.images!,
                  state.selectedImage!,
                ),
              ),
            ],
          );
        }
        return SizedBox(
          width: 350,
          height: 150,
          child: DashedButton(
            label: AppLocale.current.add_branch_picture,
            onTap: () {},
          ),
        );
      },
    );
  }

  List<Widget> generatePhotoCells(
    List<String> imagePaths,
    String selectedImage,
  ) {
    final cells = <Widget>[BranchProfileAddCell()];

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
