import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/breadcrums/breadcrums.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/menu_button/menu_button.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/menu_user_data.dart';
import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({
    Key? key,
    required this.selectedPage,
  }) : super(key: key);

  final String selectedPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: solitude1,
      padding: const EdgeInsets.only(
        left: 26,
        top: 26,
        right: 26,
        bottom: 10,
      ),
      child: Row(
        children: [
          BreadCrumbs(
            basePathName: 'Business Terminal',
            selectedPage: selectedPage,
          ),
          const Spacer(),
          MenuButton(
            image: Assets.imagesAdvertising,
            onPress: () {},
            count: 1,
          ),
          MenuButton(
            image: Assets.imagesFinanzen,
            onPress: () {},
          ),
          const SizedBox(width: 16),
          const MenuUserData(
            userName: 'Max M.',
          ),
        ],
      ),
    );
  }
}
