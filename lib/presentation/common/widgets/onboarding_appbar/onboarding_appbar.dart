// DropdownButtonHideUnderline(
// child: DropdownButton2(
// customButton: const Icon(
// Icons.list,
// size: 46,
// color: Colors.red,
// ),
// customItemsIndexes: const [3],
// customItemsHeight: 8,
// items: [
// ...MenuItems.firstItems.map(
// (item) =>
// DropdownMenuItem<MenuItem>(
// value: item,
// child: MenuItems.buildItem(item),
// ),
// ),
// const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
// ...MenuItems.secondItems.map(
// (item) =>
// DropdownMenuItem<MenuItem>(
// value: item,
// child: MenuItems.buildItem(item),
// ),
// ),
// ],
// onChanged: (value) {
// MenuItems.onChanged(context, value as MenuItem);
// },
// itemHeight: 48,
// itemPadding: const EdgeInsets.only(left: 16, right: 16),
// dropdownWidth: 160,
// dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
// dropdownDecoration: BoxDecoration(
// borderRadius: BorderRadius.circular(4),
// color: Colors.redAccent,
// ),
// dropdownElevation: 8,
// offset: const Offset(0, 8),
// ),
// ),
// ),
// );

import 'package:business_terminal/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingAppbar extends StatelessWidget {
  const OnboardingAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            width: 120,
            height: 45,
            child: SvgPicture.asset(
              Assets.imagesHamsterLogo,
            ),
          ),
        ),
        // const Spacer(),

        ///implement language selector
      ],
    );
  }
}
