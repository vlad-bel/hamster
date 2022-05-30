import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.image,
    required this.onPress,
    this.count,
  }) : super(key: key);

  final String image;
  final VoidCallback onPress;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoButton(
          onPressed: onPress,
          padding: EdgeInsets.zero,
          child: SvgPicture.asset(
            image,
            width: 22,
            height: 22,
            color: lynch,
          ),
        ),
        if (count != null)
          Transform.translate(
            offset: const Offset(26, 0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: razzmatazz,
              ),
              padding: const EdgeInsets.all(4),
              child: Text(
                count.toString(),
                style: inter10SemiBold.copyWith(
                  color: white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
