import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/status_cell/base_status_cell.dart';
import 'package:flutter/material.dart';

class BranchProfileStatusCell extends StatelessWidget {
  const BranchProfileStatusCell({
    Key? key,
    required this.branch,
  }) : super(key: key);

  final BranchProfile? branch;

  @override
  Widget build(BuildContext context) {
    final fillProgress = branch?.fillingProgress ?? 0;
    return DataCompleteStatusCell(value: fillProgress);
  }
}
