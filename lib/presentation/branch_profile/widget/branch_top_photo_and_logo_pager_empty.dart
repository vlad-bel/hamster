import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/branch_profile_picture/branch_profile_picture_page.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/rect_dashed_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BranchTopPhotoAndLogoPagerEmpty extends StatelessWidget {
  const BranchTopPhotoAndLogoPagerEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: RectDashedButton(
            onTap: () {
              Navigator.pushNamed(
                context,
                BranchProfilePicturePage.path,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 128,
            left: 64,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: DottedBorder(
                radius: const Radius.circular(4),
                dashPattern: const [7, 7],
                color: lynch.withOpacity(0.3),
                borderType: BorderType.Circle,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: denim.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
