import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddLogoRoundAddCellWidget extends StatelessWidget {
  const AddLogoRoundAddCellWidget({
    Key? key,
    required this.onPressed,
    this.dashPattertn = const [7, 7],
  }) : super(key: key);

  final List<double> dashPattertn;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          onTap: onPressed,
          child: Ink(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: DottedBorder(
              dashPattern: dashPattertn,
              color: lynch.withOpacity(0.3),
              borderType: BorderType.Circle,
              strokeWidth: 1.2,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
        ),
      ),
    );
  }
}
