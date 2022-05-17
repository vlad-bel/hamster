import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/company_data_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/connection_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/edit_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/status_cell.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileViewTableRow extends DataTableSource {
  ProfileViewTableRow({
    required this.companies,
  });

  final List<RepCompany> companies;

  ///todo refactor to bloc
  ///will be done on next pull request
  void sort<T>(Comparable<T> Function(RepCompany d) getField, bool ascending) {
    companies.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final company = companies[index];
    return DataRow2.byIndex(
      index: index,
      selected: false,
      onSelectChanged: (value) {},
      cells: [
        DataCell(
          CompanyCell(
            repCompany: company,
          ),
        ),
        ///TODO remove mock data
        ///get data from backend
        const DataCell(Text('0000')),
        const DataCell(
          CompanyCellAvatar(
            imagePath: [
              ///TODO remove mock data
              ///get data from backend
              "https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg",
              "https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg",
              "https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg",
            ],
          ),
        ),
        DataCell(
          Row(
            children: [
              ConnectionCell(
                currentValue: 5,
                maxValue: 5,
                title: tr('tills'),
              ),
              const SizedBox(width: 8),
              ConnectionCell(
                currentValue: 2,
                maxValue: 5,
                title: tr('branches'),
              ),
            ],
          ),
        ),
        const DataCell(
          VisibleStatusCell(
            visible: false,
          ),
        ),
        const DataCell(
          EditCell(),
        ),
      ],
    );
  }

  @override
  int get rowCount => companies.length;

  @override
  bool get isRowCountApproximate => true;

  @override
  int get selectedRowCount => 0;
}
