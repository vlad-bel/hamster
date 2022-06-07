import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:business_terminal/presentation/common/widgets/dynamic_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedPicture extends StatelessWidget {
  const SelectedPicture({
    Key? key,
    required this.image,
  }) : super(key: key);

  ///could be string path or Uint8List data
  final AppColoredFile image;

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
            child: DynamicBranchImage(
              path: image,
              fit: BoxFit.cover,
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
                icon: Icons.remove,
                onEditTap: () {
                  context.read<BranchProfilePictureCubit>().removeSelectedImage(
                        image,
                      );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
