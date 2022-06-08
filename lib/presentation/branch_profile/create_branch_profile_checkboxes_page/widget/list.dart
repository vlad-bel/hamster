import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/widget/list_item.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/widget/list_item_header.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';

class BranchProfileDataCheckBoxesList extends StatelessWidget {
  const BranchProfileDataCheckBoxesList(
    this.state, {
    required this.company,
    Key? key,
  }) : super(key: key);

  final CreateBranchProfileCheckboxesData state;
  final RepCompany company;

  @override
  Widget build(BuildContext context) {
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
          ListView(
            shrinkWrap: true,
            children: _buildListItems(company, state),
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
    final country = company.company?.country;

    logger.d(company.company.toString());

    return [
      if (!companyName.isEmptyOrNull)
        BranchProfileDataCheckboxListItem(
          fieldContent: companyName!,
          fieldType: CompanyDataCommonFieldsWithBranchData.companyName,
          state: state,
        ),
      if (!streetName.isEmptyOrNull)
        BranchProfileDataCheckboxListItem(
          fieldContent: '${streetName!} ${streetNumber!}',
          fieldType: CompanyDataCommonFieldsWithBranchData.streetNameAndNumber,
          state: state,
        ),
      if (!postalCode.isEmptyOrNull)
        BranchProfileDataCheckboxListItem(
          fieldContent: postalCode!,
          fieldType: CompanyDataCommonFieldsWithBranchData.postalCode,
          state: state,
        ),
      if (!city.isEmptyOrNull)
        BranchProfileDataCheckboxListItem(
          fieldContent: city!,
          fieldType: CompanyDataCommonFieldsWithBranchData.city,
          state: state,
        ),
      if (!country.isEmptyOrNull)
        BranchProfileDataCheckboxListItem(
          fieldContent: country!,
          fieldType: CompanyDataCommonFieldsWithBranchData.country,
          state: state,
        ),
    ];
  }
}
