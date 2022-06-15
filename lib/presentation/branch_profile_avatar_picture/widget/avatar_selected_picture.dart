import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_image_widget.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:flutter/material.dart';

class AvatarSelectedPicture extends StatelessWidget {
  const AvatarSelectedPicture(
      {Key? key,
      required this.appFile,
      required this.onPressed,
      required this.showEditButton})
      : super(key: key);

  final AppColoredFile appFile;
  final VoidCallback? onPressed;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: ClipOval(
            child: AppImageWidget(
              appFile: appFile,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (onPressed != null && showEditButton)
          SizedBox(
            width: 200,
            height: 200,
            child: Transform.translate(
              offset: const Offset(-12, 16),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: EditButton(
                    icon: Icons.edit,
                    onEditTap: onPressed!,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
