import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_image_widget.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:flutter/material.dart';

class AddLogoSelectedWidget extends StatelessWidget {
  const AddLogoSelectedWidget({
    Key? key,
    required this.file,
    required this.showEditButton,
    required this.onPressed,
  }) : super(key: key);

  final AppColoredFile file;
  final VoidCallback onPressed;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: ClipOval(
            child: Container(
              color: file.color != null && file.color?.length == 6
                  ? Color(
                      int.parse('0xFF${file.color!}'),
                    )
                  : Colors.transparent,
              child: AppImageWidget(
                appFile: file,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        if (showEditButton)
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
                    onEditTap: onPressed,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
