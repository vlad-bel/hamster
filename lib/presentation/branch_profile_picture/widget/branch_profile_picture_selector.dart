import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_picture_cell.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_selected_picture.dart';
import 'package:flutter/material.dart';

class BranchProfilePictureSelector extends StatelessWidget {
  const BranchProfilePictureSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectedPicture(
          path:
              'https://media.istockphoto.com/photos/beautiful-panoramic-view-of-tbilisi-at-sunset-picture-id476813550?k=20&m=476813550&s=612x612&w=0&h=nkgs_znOulcr77969-rB-mQ4Tyr8qN53crzMASFZlDU=',
        ),
        SizedBox(height: 12),
        Row(
          children: [
            BranchProfileAddCell(),
            SizedBox(width: 6),
            BranchProfilePictureCell(
              isSelected: true,
              imagePath:
                  'https://media.istockphoto.com/photos/beautiful-panoramic-view-of-tbilisi-at-sunset-picture-id476813550?k=20&m=476813550&s=612x612&w=0&h=nkgs_znOulcr77969-rB-mQ4Tyr8qN53crzMASFZlDU=',
            ),
            SizedBox(width: 6),
            BranchProfilePictureCell(
              isSelected: false,
              imagePath:
                  'https://media.istockphoto.com/photos/beautiful-panoramic-view-of-tbilisi-at-sunset-picture-id476813550?k=20&m=476813550&s=612x612&w=0&h=nkgs_znOulcr77969-rB-mQ4Tyr8qN53crzMASFZlDU=',
            ),
            SizedBox(width: 6),
            BranchProfilePictureCell(
              isSelected: false,
              imagePath:
                  'https://media.istockphoto.com/photos/beautiful-panoramic-view-of-tbilisi-at-sunset-picture-id476813550?k=20&m=476813550&s=612x612&w=0&h=nkgs_znOulcr77969-rB-mQ4Tyr8qN53crzMASFZlDU=',
            ),
          ],
        ),
      ],
    );
  }
}
