import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/widget/list_item.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/widget/list_item_header.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/mock_repository/mock_company_repo.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';

class BranchProfileDataCheckBoxesList extends StatelessWidget {
  const BranchProfileDataCheckBoxesList(this.state, {Key? key})
      : super(key: key);

  final CreateBranchProfileCheckboxesData state;

  @override
  Widget build(BuildContext context) {
    // TODO: mock
    final company = CompanyRepositoryMock.getMockCompany();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: lynch.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          BranchProfileDataCheckboxListItemHeader(
            text: AppLocale.of(context).select_all,
          ),
          SizedBox(
            height: 245,
            child: ListView(
              children: _buildListItems(company, state),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildListItems(
    RepCompany company,
    CreateBranchProfileCheckboxesData state,
  ) {
    final companyName = company.company?.companyName;
    final streetName = company.company?.streetName;
    final streetNumber = company.company?.streetNumber;
    final postalCode = company.company?.postalCode;
    final city = company.company?.city;

    return [
      if (companyName != null && companyName.isNotEmpty)
        BranchProfileDataCheckboxListItem(
          fieldContent: companyName,
          fieldType: CompanyDataCommonFieldsWithBranchData.companyName,
          state: state,
        ),
      if (!streetName.isEmptyOrNull && !streetNumber.isEmptyOrNull)
        BranchProfileDataCheckboxListItem(
          fieldContent: '${streetName!} ${streetNumber!}',
          fieldType: CompanyDataCommonFieldsWithBranchData.streetNameAndNumber,
          state: state,
        ),
      if (postalCode != null && postalCode.isNotEmpty)
        BranchProfileDataCheckboxListItem(
          fieldContent: postalCode,
          fieldType: CompanyDataCommonFieldsWithBranchData.postalCode,
          state: state,
        ),
      if (city != null && city.isNotEmpty)
        BranchProfileDataCheckboxListItem(
          fieldContent: city,
          fieldType: CompanyDataCommonFieldsWithBranchData.city,
          state: state,
        ),
    ];
  }
}
