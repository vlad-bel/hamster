import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditCell extends StatelessWidget {
  const EditCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          width: 64,
          height: 64,
          child: MaterialButton(
            onPressed: () {},
            child: SvgPicture.asset(
              'images/edit.svg',
            ),
          ),
        ),
      ],
    );
  }
}
