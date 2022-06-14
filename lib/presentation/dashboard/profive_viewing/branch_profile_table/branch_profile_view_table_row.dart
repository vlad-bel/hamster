import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/company/logo.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/company_cell/company_data_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/edit_cell/edit_cell.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/branch_profile_table/branch_profile_cell.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/branch_profile_table/branch_profile_connection_data.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/branch_profile_table/branch_profile_status_cell.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class BranchProfileViewTableRow extends DataTableSource {
  BranchProfileViewTableRow({
    required this.onPressedEdit,
    required this.branches,
    required this.company,
  });

  final BranchProfileWithPaging? branches;
  final RepCompany? company;
  final VoidCallback onPressedEdit;

  @override
  DataRow getRow(int index) {
    final logos = <CompanyLogo>[
      CompanyLogo(
        fileName: 'https://www.pngwing.com/de/free-png-ztplp',
        backgroundColor: '#FAFAFA',
      )
    ];

    final branch = branches?.data[index];
    return DataRow2.byIndex(
      index: index,
      onSelectChanged: (value) {},
      cells: [
        // FILIALEN:
        if (branch != null)
          DataCell(
            BranchProfileCell(branch: branch),
          ),

        // NUMMER:
        DataCell(
          Text(branch?.branchNumber ?? AppLocale.current.error),
        ),

        // NUTZER: (Company logo)
        DataCell(
          CompanyCellAvatar(
            imagePath: logos,
          ),
        ),

        // ANBINDUNG:
        DataCell(
          BranchProfileConnectionData(
            branch: branch,
          ),
        ),

        // STATUS:
        DataCell(
          BranchProfileStatusCell(
            branch: branch,
          ),
        ),
        DataCell(
          EditCell(
            onPressed: onPressedEdit,
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => branches?.data.length ?? 0;

  @override
  int get selectedRowCount => 0;

  void sort<T>(
    Comparable<T> Function(BranchProfile d) getField, {
    required bool ascending,
  }) {
    branches?.data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
