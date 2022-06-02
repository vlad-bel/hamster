import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_picture_cell.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchProfileAddCell extends StatelessWidget {
  const BranchProfileAddCell({
    Key? key,
    this.dashPattertn = const [7, 7],
  }) : super(key: key);

  final List<double> dashPattertn;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        onTap: () {
          pickAndCropImage(context);
        },
        child: Ink(
          width: 50,
          height: 50,
          child: DottedBorder(
            dashPattern: dashPattertn,
            color: lynch.withOpacity(0.3),
            radius: Radius.circular(4),
            strokeWidth: 1.2,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  color: denim.withOpacity(0.1),
                ),
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    Assets.imagesIconPlus,
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
