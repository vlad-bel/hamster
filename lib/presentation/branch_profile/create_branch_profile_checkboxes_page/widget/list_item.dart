import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/widget/list_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileDataCheckboxListItem extends StatelessWidget {
  const BranchProfileDataCheckboxListItem({
    Key? key,
    required this.fieldContent,
    required this.fieldType,
    required this.state,
  }) : super(key: key);

  final String fieldContent;
  final CompanyDataCommonFieldsWithBranchData fieldType;
  final CreateBranchProfileCheckboxesData state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          value: isSelected(state),
          title: Text(fieldContent),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) =>
              onChangeCheckBox(context, isSelectedParam: value),
        ),
        const CheckboxesListDivider(),
      ],
    );
  }

  bool isSelected(CreateBranchProfileCheckboxesData data) {
    final isSelected = data[fieldType];
    return isSelected ?? false;
  }

  void onChangeCheckBox(
    BuildContext context, {
    required bool? isSelectedParam,
  }) {
    final isSelected = isSelectedParam ?? false;
    context
        .read<CreateBranchProfileCheckboxesCubit>()
        .changeSelection(fieldType, isSelected: isSelected);
  }
}
