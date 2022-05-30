import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderCell extends StatelessWidget {
  const HeaderCell({
    Key? key,
    required this.name,
    this.sortable = false,
  }) : super(key: key);

  final String name;
  final bool sortable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: inter14,
        ),
        if (sortable) const SizedBox(width: 8),
        if (sortable)
          SizedBox(
            width: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('images/arrow_up.svg'),
                SizedBox(
                  height: 2,
                ),
                SvgPicture.asset('images/arrow_down.svg'),
              ],
            ),
          )
      ],
    );
  }
}
