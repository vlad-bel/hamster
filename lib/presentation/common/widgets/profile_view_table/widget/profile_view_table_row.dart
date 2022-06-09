import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/company_cell/company_data_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/edit_cell/edit_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/status_cell/status_cell.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'cells/connection_cell/connection_data.dart';

class ProfileViewTableRow extends DataTableSource {
  ProfileViewTableRow({
    required this.companies,
    required this.onPressed,
    this.company,
  });

  final List<RepCompany> companies;
  final Company? company;
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
            company: company,
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
            imagePath: repCompany.rep?.avatar != null
                ? [
                    repCompany.rep!.avatar!,
                  ]
                : null,
          ),
        ),
        DataCell(
          ConnectionData(
            repCompany: repCompany,
          ),
        ),
        DataCell(
          CompanyStatusCell(
            repCompany: repCompany,
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
