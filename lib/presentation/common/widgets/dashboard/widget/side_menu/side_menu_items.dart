import 'dart:ui';

import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';

class SideMenuItems extends StatelessWidget {
  const SideMenuItems({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            children: [
              MenuItem(
                image: '/images/finanzen.svg',
                name: 'Finanzen',
                routeName: 'finanzen',
                subItems: [
                  MenuSubItem(
                    index: 0,
                    controllerIndex: controller.index,
                    name: 'Finanzen1',
                    onTap: (index) {
                      navigateTo(index);
                    },
                  ),
                ],
              ),
              BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  final count = state.when(init: (count) => count);
                  return MenuItem(
                    image: '/images/administration.svg',
                    name: 'Administration',
                    routeName: 'administration',
                    subItems: [
                      MenuSubItem(
                        index: 1,
                        controllerIndex: controller.index,
                        name: 'Account-Verifikation',
                        onTap: (index) {
                          navigateTo(index);
                        },
                        badgeCountValue: 1,
                      ),
                      MenuSubItem(
                        index: 2,
                        controllerIndex: controller.index,
                        name: 'Mein Unternehmen',
                        onTap: (index) {
                          navigateTo(index);
                        },
                        badgeCountValue: count,
                      ),
                      MenuSubItem(
                        index: 3,
                        controllerIndex: controller.index,
                        name: 'Nutzerverwaltung',
                        onTap: (index) {
                          navigateTo(index);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateTo(int index){
    controller.animateTo(index);
  }
}

class MenuItem extends StatefulWidget {
  MenuItem({
    required this.name,
    required this.image,
    required this.subItems,
    required this.routeName,
  });

  final String name;
  final String routeName;
  final String image;
  final List<MenuSubItem> subItems;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  final controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    final initialRouteName = tabPage.page.paths[tabPage.controller.index].split(
      '/',
    )[1];

    if (initialRouteName == widget.routeName) {
      controller.expanded = true;
    }
    return ExpandablePanel(
      controller: controller,
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        hasIcon: false,
      ),
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.image,
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 20),
            Text(
              widget.name,
              style: inter16Medium,
            ),
          ],
        ),
      ),
      expanded: Row(
        children: [
          const SizedBox(width: 6),
          Container(
            width: 1,
            height: widget.subItems.length * 58,
            color: lynch.withOpacity(0.3),
          ),
          const SizedBox(width: 26),
          Expanded(
            child: Column(
              children: widget.subItems,
            ),
          ),
        ],
      ),
      collapsed: const SizedBox(),
    );
  }
}

class MenuSubItem extends StatelessWidget {
  const MenuSubItem({
    Key? key,
    required this.name,
    required this.index,
    required this.onTap,
    this.badgeCountValue,
    required this.controllerIndex,
  })  : isSelected = index == controllerIndex,
        super(key: key);

  final String name;
  final int? badgeCountValue;
  final bool isSelected;
  final Function(int index) onTap;
  final int index;
  final int controllerIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: badgeCountValue != null ? 6 : 12,
          ),
          decoration: BoxDecoration(
            color: isSelected ? denim.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            children: [
              Text(
                name,
                style: isSelected
                    ? inter16Medium.copyWith(color: denim)
                    : inter16Medium,
              ),
              const Spacer(),
              if (badgeCountValue != null)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isSelected ? denim : lynch.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badgeCountValue.toString(),
                    style: inter16Medium.copyWith(
                      color: isSelected ? white : lynch,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
