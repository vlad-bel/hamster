import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/view/profile_edit.dart';
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
            onPressed: () {
              authNavigatorKey.currentState?.pushNamed(ProfileEditPage.path);
            },
            child: SvgPicture.asset(
              'images/edit.svg',
            ),
          ),
        ),
      ],
    );
  }
}
