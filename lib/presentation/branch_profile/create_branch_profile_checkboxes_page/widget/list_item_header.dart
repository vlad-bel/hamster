import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/widget/list_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileDataCheckboxListItemHeader extends StatelessWidget {
  const BranchProfileDataCheckboxListItemHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: lynch.withOpacity(0.05)),
          child: CheckboxListTile(
            value: isSelected(context),
            title: Text(text),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) => onChangeCheckBox(context, value: value),
          ),
        ),
        CheckboxesListDivider(),
      ],
    );
  }

  bool isSelected(BuildContext context) {
    final result =
        context.read<CreateBranchProfileCheckboxesCubit>().isSelectedAll();

    return result;
  }

  void onChangeCheckBox(BuildContext context, {required bool? value}) {
    const type = CompanyDataCommonFieldsWithBranchData.allSelected;

    context
        .read<CreateBranchProfileCheckboxesCubit>()
        .changeSelection(type, isSelected: value);
  }
}
