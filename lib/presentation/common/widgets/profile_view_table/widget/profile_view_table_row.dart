import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/company_data_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/connection_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/edit_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/status_cell.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ProfileViewTableRow extends DataTableSource {
  ProfileViewTableRow({
    required this.companies,
    required this.onPressed,
  });

  final List<RepCompany> companies;
  final VoidCallback onPressed;

  @override
  DataRow getRow(int index) {
    final repCompany = companies[index];
    return DataRow2.byIndex(
      index: index,
      onSelectChanged: (value) {},
      cells: [
        DataCell(
          CompanyCell(
            repCompany: repCompany,
          ),
        ),

        ///TODO remove mock data
        ///get data from backend
        DataCell(
          Text(
            '${repCompany.company?.companyNumber}',
          ),
        ),
        DataCell(
          CompanyCellAvatar(
            imagePath: [
              ///TODO remove mock data
              ///get data from backend
              'https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg',
              'https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg',
              'https://avavatar.ru/images/avatars/7/avatar_YBlDMPmbBUuzbNcO.jpg',
            ],
          ),
        ),
        DataCell(
          Row(
            children: [
              ConnectionCell(
                // currentConnectionValue: int.tryParse(
                //       (repCompany.company?.connectionsStatistics['branches'][0]
                //               as String?)
                //           .toString(),
                //     ) ??
                //     0,
                // maxConnectionValue: int.tryParse(
                //       (repCompany.company?.connectionsStatistics['branches'][2]
                //               as String?)
                //           .toString(),
                //     ) ??
                //     5,
                title: AppLocale.current.tills,
                currentConnectionValue: 5,
                maxConnectionValue: 5,
              ),
              const SizedBox(width: 8),
              ConnectionCell(
                currentConnectionValue: 2,
                maxConnectionValue: 5,
                title: AppLocale.current.branches,
              ),
            ],
          ),
        ),
        const DataCell(
          VisibleStatusCell(
            visible: false,
          ),
        ),
        DataCell(
          EditCell(
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => companies.length;

  @override
  int get selectedRowCount => 0;

  ///todo refactor to bloc
  ///will be done on next pull request
  void sort<T>(
    Comparable<T> Function(RepCompany d) getField, {
    required bool ascending,
  }) {
    companies.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
