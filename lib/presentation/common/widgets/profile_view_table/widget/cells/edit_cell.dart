import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditCell extends StatelessWidget {
  const EditCell({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          width: 64,
          height: 64,
          child: MaterialButton(
            onPressed: onPressed,
            child: SvgPicture.asset(
              'images/edit.svg',
            ),
          ),
        ),
      ],
    );
  }
}
