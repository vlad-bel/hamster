import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenuItems extends StatefulWidget {
  const SideMenuItems({
    Key? key,
    required this.navigateTo,
    required this.selectedIndex,
    required this.selectedPage,
    this.isBlockFinance,
  }) : super(key: key);

  final Function(int, String routeName) navigateTo;
  final int selectedIndex;
  final String selectedPage;
  final bool? isBlockFinance;

  @override
  State<SideMenuItems> createState() => _SideMenuItemsState();
}

class _SideMenuItemsState extends State<SideMenuItems> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            children: [
              MenuItem(
                image: Assets.imagesFinanzen,
                name: 'Finanzen',
                initialRouteName: 'finance',
                selectedRoute: widget.selectedPage,
                isBlocked: widget.isBlockFinance,
                subItems: [
                  MenuSubItem(
                    index: 0,
                    name: 'Finanzen1',
                    onTap: (index, routeName) {
                      widget.navigateTo(index, routeName);
                    },
                    selectedRoute: widget.selectedPage,
                    routeName: '/finance/finance1',
                  ),
                  MenuSubItem(
                    index: 0,
                    name: 'Finanzen2',
                    onTap: (index, routeName) {
                      widget.navigateTo(index, routeName);
                    },
                    selectedRoute: widget.selectedPage,
                    routeName: '/finance/finance2',
                  ),
                ],
              ),
              BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  final count =
                      state.whenOrNull(init: (count, _, __, ___) => count);
                  return MenuItem(
                    image: Assets.imagesAdministration,
                    name: 'Administration',
                    initialRouteName: 'administration',
                    selectedRoute: widget.selectedPage,
                    subItems: [
                      MenuSubItem(
                        index: 1,
                        name: 'Account-Verifikation',
                        onTap: (index, routeName) {
                          widget.navigateTo(index, routeName);
                        },
                        badgeCountValue: 1,
                        selectedRoute: widget.selectedPage,
                        routeName: '/administration/account-verification',
                      ),
                      MenuSubItem(
                        index: 1,
                        name: 'Mein Unternehmen',
                        onTap: (index, routeName) {
                          widget.navigateTo(index, routeName);
                        },
                        badgeCountValue: count,
                        selectedRoute: widget.selectedPage,
                        routeName: '/administration/my-company',
                      ),
                      MenuSubItem(
                        index: 1,
                        name: 'Nutzerverwaltung',
                        onTap: (index, routeName) {
                          widget.navigateTo(index, routeName);
                        },
                        selectedRoute: widget.selectedPage,
                        routeName: '/administration/user-management',
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
}

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key? key,
    required this.name,
    required this.image,
    required this.subItems,
    required this.initialRouteName,
    required this.selectedRoute,
    this.isBlocked = true,
  }) : super(key: key);

  final String name;
  final String initialRouteName;
  final String selectedRoute;
  final String image;
  final List<MenuSubItem> subItems;
  final bool? isBlocked;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  final controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    if (widget.selectedRoute.split('/')[1] == widget.initialRouteName) {
      controller.expanded = true;
    }

    return ExpandablePanel(
      controller: controller,
      theme: ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        hasIcon: false,
        tapHeaderToExpand: widget.isBlocked,
      ),
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
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
    required this.routeName,
    required this.selectedRoute,
  })  : isSelected = selectedRoute == routeName,
        super(key: key);

  final String name;
  final int? badgeCountValue;
  final bool isSelected;
  final Function(int index, String routeName) onTap;

  final int index;
  final String routeName;
  final String selectedRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          onTap(index, routeName);
          Navigator.of(navigatorKeys[index]!.currentState!.context).pushNamed(
            routeName,
          );
        },
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
