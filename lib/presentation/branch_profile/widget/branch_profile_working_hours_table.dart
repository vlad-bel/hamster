import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container.dart';
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
    final editButton = Transform.translate(
      offset: Offset(5, -10),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 25,
          height: 25,
          child: RawMaterialButton(
            onPressed: () {
              authNavigatorKey.currentState?.pop();
            },
            fillColor: razzmatazz,
            shape: CircleBorder(),
            child: Icon(Icons.edit_outlined, color: white, size: 15),
          ),
        ),
        // Icon(Icons.edit),
      ),
    );

    return Stack(
      children: [
        BorderedContainer(
          title: AppLocale.current.opening_hours,
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
                  AppLocale.current.monday,
                  Text(AppLocale.current.closed),
                ),
                buildTableRow(
                  AppLocale.current.tuesday,
                  Text(AppLocale.current.closed),
                ),
                buildTableRow(
                  AppLocale.current.wednesday,
                  Text(AppLocale.current.closed),
                ),
                buildTableRow(
                  AppLocale.current.thursday,
                  Text(AppLocale.current.closed),
                ),
                buildTableRow(
                  AppLocale.current.friday,
                  Text(AppLocale.current.closed),
                ),
                buildTableRow(
                  AppLocale.current.saturday,
                  Text(AppLocale.current.closed),
                ),
                buildTableRow(
                  AppLocale.current.sunday,
                  Text(AppLocale.current.closed),
                ),
              ],
            ),
          ),
        ),
        editButton,
      ],
    );
  }
}
