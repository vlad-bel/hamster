import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_header.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    required this.navigateTo,
    required this.selectedIndex,
    required this.selectedPage,
    required this.repCompany,
    this.isBlockFinance,
  }) : super(key: key);

  final Function(int, String routename) navigateTo;
  final int selectedIndex;
  final String selectedPage;
  final RepCompany? repCompany;
  final bool? isBlockFinance;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
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
          SideMenuHeader(
            repCompany: widget.repCompany,
          ),
          const SizedBox(height: 30),
          SideMenuItems(
            navigateTo: widget.navigateTo,
            selectedIndex: widget.selectedIndex,
            selectedPage: widget.selectedPage,
            isBlockFinance: widget.isBlockFinance,
          ),
          Text(
            '${AppLocale.of(context).custom_number} ${widget.repCompany?.company?.companyNumber}',
            style: inter14.copyWith(
              color: lynch.withOpacity(0.9),
            ),
          )
        ],
      ),
    );
  }
}
