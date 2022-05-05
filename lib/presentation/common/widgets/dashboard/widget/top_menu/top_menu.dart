import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/breadcrums/breadcrums.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/menu_button/menu_button.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/menu_user_data.dart';

import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({Key? key}) : super(key: key);

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
          const BreadCrumbs(
            basePathName: 'Business Terminal',
          ),
          const Spacer(),
          MenuButton(
            image: 'images/advertising.svg',
            onPress: () {},
            count: 1,
          ),
          MenuButton(
            image: 'images/finanzen.svg',
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