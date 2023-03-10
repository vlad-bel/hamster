import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/view/create_branch_profile_checkboxes_page.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_page.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/control_panel/branch_table_control_table.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/branch_profile_table/branch_profile_view_table.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/branch_profile_table/branch_profile_view_table_row.dart';
import 'package:flutter/material.dart';

class BranchProfileTableWithData extends StatelessWidget {
  const BranchProfileTableWithData({
    Key? key,
    this.repCompany,
    required this.branchProfiles,
  }) : super(key: key);

  final RepCompany? repCompany;
  final BranchProfileWithPaging? branchProfiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BranchTableControlPanel(),
        BranchProfileViewTable(
          sortable: true,
          row: BranchProfileViewTableRow(
            onPressedEdit: () => onNavigateToEditBranch(repCompany, context),
            branches: branchProfiles,
            company: repCompany,
          ),
        ),
        const SizedBox(height: 16),
        DashedButton(
          onTap: () => onNavigateToCreateNewBranch(repCompany),
          label: AppLocale.of(context).add_branch,
        ),
      ],
    );
  }

  void onNavigateToCreateNewBranch(
    RepCompany? company,
  ) {
    final args = {
      CreateBranchProfileCheckboxesPage.paramRepCompany: company,
    };

    authNavigatorKey.currentState?.pushNamed(
      CreateBranchProfileCheckboxesPage.path,
      arguments: args,
    );
  }

  void onNavigateToEditBranch(
    RepCompany? company,
    BuildContext context,
  ) {
    final dataMap = {
      CompanyDataCommonFieldsWithBranchData.companyName: true,
      CompanyDataCommonFieldsWithBranchData.streetName: true,
      CompanyDataCommonFieldsWithBranchData.streetNumber: true,
      CompanyDataCommonFieldsWithBranchData.postalCode: true,
      CompanyDataCommonFieldsWithBranchData.city: true,
      CompanyDataCommonFieldsWithBranchData.country: false,
      CompanyDataCommonFieldsWithBranchData.allSelected: true,
    };

    authNavigatorKey.currentState?.pushNamed(
      BranchProfilePage.path,
      arguments: {
        BranchProfilePage.paramCompany: company,
        BranchProfilePage.paramData: dataMap,
      },
    );
  }
}
