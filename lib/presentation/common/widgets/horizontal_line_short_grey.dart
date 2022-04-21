import 'package:flutter/material.dart';

class HorizontalLineShortGrey extends StatelessWidget {
  const HorizontalLineShortGrey({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 44,
      decoration: BoxDecoration(
        color: const Color(0xff676f86).withOpacity(0.1),
      ),
    );
  }
}
