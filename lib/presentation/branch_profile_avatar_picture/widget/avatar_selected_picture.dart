import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:business_terminal/presentation/common/widgets/dynamic_image.dart';
import 'package:flutter/material.dart';

class AvatarSelectedPicture extends StatelessWidget {
  const AvatarSelectedPicture({
    Key? key,
    required this.path,
    required this.showEditButton,
  }) : super(key: key);

  final dynamic path;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: ClipOval(
            child: DynamicImage(
              path: path,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (showEditButton)
          SizedBox(
            width: 200,
            height: 200,
            child: Transform.translate(
              offset: Offset(-12, 16),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(2),
                  child: EditButton(
                    icon: Icons.edit,
                    onEditTap: () {},
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
