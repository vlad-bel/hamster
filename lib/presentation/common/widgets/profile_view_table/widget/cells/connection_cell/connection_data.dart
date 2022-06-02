import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/connection_cell/connection_cell.dart';
import 'package:flutter/material.dart';

class ConnectionData extends StatelessWidget {
  const ConnectionData({
    Key? key,
    required this.repCompany,
  }) : super(key: key);

  final RepCompany repCompany;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateConnectionCells(),
    );
  }

  List<Widget> generateConnectionCells() {
    final cells = <Widget>[];
    var _index = 0;
    repCompany.company?.connectionsStatistics?.forEach((key, value) {
      final title = key;
      final progressValues = value.split('/');
      final currentValue = int.parse(progressValues[0]);
      final maxValue = int.parse(progressValues[1]);

      cells.add(
        ConnectionCell(
          currentConnectionValue: currentValue,
          maxConnectionValue: maxValue,
          title: title,
        ),
      );

      if (_index < repCompany.company!.connectionsStatistics!.length) {
        cells.add(
          const SizedBox(width: 8),
        );
      }
      _index++;
    });

    return cells;
  }
}
