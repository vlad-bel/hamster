import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/image/image_paths.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderAppBarWidget extends StatelessWidget {
  const HeaderAppBarWidget({
    Key? key,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: dropShadowColor,
            offset: const Offset(
              0,
              3,
            ),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: leading ??
                  WhiteButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 42,
                child: SvgPicture.asset(
                  ImagePaths.logo(SvgPaths.brandLogoDenim),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: trailing ?? const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
