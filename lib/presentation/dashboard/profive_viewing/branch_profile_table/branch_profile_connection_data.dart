import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/connection_cell/connection_cell.dart';
import 'package:flutter/material.dart';

class BranchProfileConnectionData extends StatelessWidget {
  const BranchProfileConnectionData({
    Key? key,
    required this.branch,
  }) : super(key: key);

  final BranchProfile? branch;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateConnectionCells(),
    );
  }

  List<Widget> generateConnectionCells() {
    final cells = <Widget>[
      ConnectionCell(
        currentConnectionValue: branch?.posesData?.length ?? 0,
        maxConnectionValue: 5,
        title: AppLocale.current.tills,
      )
    ];

    return cells;
  }
}
