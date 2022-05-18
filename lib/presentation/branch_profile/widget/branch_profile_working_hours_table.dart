import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BranchProfileWorkingHoursTable extends StatelessWidget {
  const BranchProfileWorkingHoursTable({
    Key? key,
  }) : super(key: key);

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
            onPressed: () {},
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0x4d676f86),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
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
                  LocaleKeys.monday.tr(),
                  Text(LocaleKeys.closed).tr(),
                ),
                buildTableRow(
                  LocaleKeys.tuesday.tr(),
                  Text(LocaleKeys.closed).tr(),
                ),
                buildTableRow(
                  LocaleKeys.wednesday.tr(),
                  Text(LocaleKeys.closed).tr(),
                ),
                buildTableRow(
                  LocaleKeys.thursday.tr(),
                  Text(LocaleKeys.closed).tr(),
                ),
                buildTableRow(
                  LocaleKeys.friday.tr(),
                  Text(LocaleKeys.closed).tr(),
                ),
                buildTableRow(
                  LocaleKeys.saturday.tr(),
                  Text(LocaleKeys.closed).tr(),
                ),
                buildTableRow(
                  LocaleKeys.sunday.tr(),
                  Text(LocaleKeys.closed).tr(),
                ),
              ],
            ),
          ),
        ),
        editButton,
        Transform.translate(
          offset: Offset(20, -8),
          child: Container(
            color: white,
            child: Text(LocaleKeys.opening_hours, style: inter12),
          ),
        )
      ],
    );
  }

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
}
