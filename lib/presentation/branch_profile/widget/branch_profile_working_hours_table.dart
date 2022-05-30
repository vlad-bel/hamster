import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:flutter/material.dart';

class BranchProfileWorkingHoursTable extends StatelessWidget {
  const BranchProfileWorkingHoursTable({
    Key? key,
  }) : super(key: key);

  TableRow buildTableRow(String dayOfWeek, Widget workingHours) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(dayOfWeek),
        ),
        workingHours,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BorderedEditContainer(
      title: AppLocale.of(context).opening_hours,
      onEditTap: () {
        authNavigatorKey.currentState?.pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            buildTableRow(
              AppLocale.of(context).monday,
              Text(AppLocale.of(context).closed),
            ),
            buildTableRow(
              AppLocale.of(context).tuesday,
              Text(AppLocale.of(context).closed),
            ),
            buildTableRow(
              AppLocale.of(context).wednesday,
              Text(AppLocale.of(context).closed),
            ),
            buildTableRow(
              AppLocale.of(context).thursday,
              Text(AppLocale.of(context).closed),
            ),
            buildTableRow(
              AppLocale.of(context).friday,
              Text(AppLocale.of(context).closed),
            ),
            buildTableRow(
              AppLocale.of(context).saturday,
              Text(AppLocale.of(context).closed),
            ),
            buildTableRow(
              AppLocale.of(context).sunday,
              Text(AppLocale.of(context).closed),
            ),
          ],
        ),
      ),
    );
  }
}
