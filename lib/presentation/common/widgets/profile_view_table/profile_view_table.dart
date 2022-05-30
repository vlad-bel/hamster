import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/header_cell.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_table_row.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ProfileViewTable extends StatefulWidget {
  const ProfileViewTable({
    Key? key,
    required this.row,
    this.sortable = false,
  }) : super(key: key);

  final ProfileViewTableRow row;
  final bool sortable;

  @override
  State<ProfileViewTable> createState() => _ProfileViewTableState();
}

class _ProfileViewTableState extends State<ProfileViewTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable2(
      minWidth: 1350,
      dividerThickness: 0,
      border: TableBorder(
        top: BorderSide(
          color: lynch.withOpacity(0.1),
        ),
        bottom: BorderSide(
          color: lynch.withOpacity(0.1),
        ),
        horizontalInside: BorderSide(
          color: lynch.withOpacity(0.1),
        ),
      ),
      dataRowHeight: 76,
      headingRowHeight: 48,
      onSelectAll: (value) {},
      horizontalMargin: 0,
      showCheckboxColumn: false,
      columnSpacing: 0,
      lmRatio: 1.5,
      columns: [
        DataColumn2(
          size: ColumnSize.L,
          label: HeaderCell(
            name: AppLocale.of(context).companies,
            sortable: widget.sortable,
          ),
        ),
        DataColumn2(
          label: HeaderCell(
            name: AppLocale.of(context).number,
            sortable: widget.sortable,
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: HeaderCell(
            name: AppLocale.of(context).user,
            sortable: widget.sortable,
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: HeaderCell(
            name: AppLocale.of(context).connection,
            sortable: widget.sortable,
          ),
        ),
        DataColumn2(
          label: HeaderCell(
            name: AppLocale.of(context).status,
            sortable: widget.sortable,
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Text(''),
          size: ColumnSize.S,
        ),
      ],
      rows: List<DataRow>.generate(
        widget.row.rowCount,
        widget.row.getRow,
      ),
    );
  }
}
