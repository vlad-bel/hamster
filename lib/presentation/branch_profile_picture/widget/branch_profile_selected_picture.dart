import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_image_widget.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedPicture extends StatelessWidget {
  const SelectedPicture({
    Key? key,
    required this.image,
  }) : super(key: key);

  final AppColoredFile image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 350,
          height: 150,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            child: AppImageWidget(
              appFile: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(12, -12),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(2),
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
