import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_header.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_items.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      color: white,
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 35,
        bottom: 25,
      ),
      child: Column(
        children: [
          const SideMenuHeader(),
          const SizedBox(height: 30),
          SideMenuItems(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
