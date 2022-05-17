import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_row.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileViewTable extends StatefulWidget {
  const ProfileViewTable({
    Key? key,
    required this.source,
  }) : super(key: key);

  final ProfileViewTableSource source;

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
          label: Text(
            tr('companies'),
            style: inter14,
          ),
        ),
        DataColumn2(
          label: Text(
            tr('number'),
            style: inter14,
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Text(
            tr('user'),
            style: inter14,
          ),
          size: ColumnSize.S,
        ),
        DataColumn2(
          label: Text(
            tr('connection'),
            style: inter14,
          ),
        ),
        DataColumn2(
          label: Text(
            tr('status'),
            style: inter14,
          ),
          size: ColumnSize.S,
        ),
        const DataColumn2(
          label: Text(''),
          size: ColumnSize.S,
        ),
      ],
      rows: List<DataRow>.generate(
        widget.source.rowCount,
        widget.source.getRow,
      ),
    );
  }
}
