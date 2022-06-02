import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/temp/days_hours.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:business_terminal/presentation/pick_day/view/pick_day_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileWorkingHoursTable extends StatelessWidget {
  BranchProfileWorkingHoursTable({
    Key? key,
    required this.state,
  }) : super(key: key) {
    hours = DaysHours(
      state.hours,
    );
  }

  final InitBranchProfileState state;
  late final DaysHours hours;

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
      onEditTap: () async {
        final args = {
          PickDayPage.paramDays: hours,
        };

        final result = await Navigator.pushNamed(
          context,
          PickDayPage.path,
          arguments: args,
        ) as DaysHours?;

        if (result == null) return;

        context
            .read<BranchProfileCubit>()
            .setOpeningHours(hours: result.originalObject());
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
            _buildTableRow(
              AppLocale.of(context).monday,
              Text(hours.monday),
            ),
            _buildTableRow(
              AppLocale.of(context).tuesday,
              Text(hours.tuesday),
            ),
            _buildTableRow(
              AppLocale.of(context).wednesday,
              Text(hours.wednesday),
            ),
            _buildTableRow(
              AppLocale.of(context).thursday,
              Text(hours.thursday),
            ),
            _buildTableRow(
              AppLocale.of(context).friday,
              Text(hours.friday),
            ),
            _buildTableRow(
              AppLocale.of(context).saturday,
              Text(hours.saturday),
            ),
            _buildTableRow(
              AppLocale.of(context).sunday,
              Text(hours.sunday),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String dayOfWeek, Widget workingHours) {
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
