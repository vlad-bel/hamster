import 'dart:developer';

import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_image_widget.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/header_cell/header_cell.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class PosOverviewView extends StatefulWidget {
  const PosOverviewView({Key? key}) : super(key: key);

  @override
  State<PosOverviewView> createState() => _PosOverviewViewState();
}

class _PosOverviewViewState extends State<PosOverviewView> {
  BranchProfileWithPaging? branchProfileWithPaging;

  @override
  void initState() {
    getIt.get<RestClient>().getBranchesByRepresentative(1).then((value) {
      setState(() {
        branchProfileWithPaging = value;
      });
    });

    getIt.get<CompanyUsecase>().getRepCompany().then((value) => {
          log(value.company.toString()),
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: solitude1,
      padding: const EdgeInsets.symmetric(
        vertical: 26,
        horizontal: 25,
      ),
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocale.of(context).company_profile,
                style: inter16SemiBold,
              ),
              const SizedBox(height: 50),
              DataTable2(
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
                    color: lynch.withOpacity(0.0),
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
                  const DataColumn2(
                    size: ColumnSize.L,
                    label: HeaderCell(
                      name: 'FILIALEN',
                      sortable: true,
                      // name: AppLocale.of(context).companies,
                    ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.S,
                    label: HeaderCell(
                      name: 'NUMMER',
                      sortable: true,

                      // name: AppLocale.of(context).companies,
                    ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.S,
                    label: const HeaderCell(name: 'BEZEICHNUNG'
                        // name: AppLocale.of(context).companies,
                        ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.S,
                    label: HeaderCell(name: 'HERSTELLER'
                        // name: AppLocale.of(context).companies,
                        ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.S,
                    label: HeaderCell(name: 'MODELL'
                        // name: AppLocale.of(context).companies,
                        ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.S,
                    label: HeaderCell(name: 'POS IDENTIFIER'
                        // name: AppLocale.of(context).companies,
                        ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.S,
                    label: HeaderCell(name: 'ANBINDUNG'
                        // name: AppLocale.of(context).companies,
                        ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.S,
                    label: HeaderCell(name: 'AKTION'
                        // name: AppLocale.of(context).companies,
                        ),
                  ),
                ],
                rows: [
                  for (final BranchProfile data
                      in branchProfileWithPaging?.data ?? <BranchProfile>[])
                    ...List<DataRow>.generate(
                      data.posesData?.length ?? 0,
                      PosOverviewRow(
                        onPressed: () {},
                        posList: data.posesData ?? <PosData>[],
                        branchProfile: data,
                      ).getRow,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PosOverviewRow extends DataTableSource {
  PosOverviewRow({
    required this.posList,
    required this.onPressed,
    required this.branchProfile,
  });

  final BranchProfile branchProfile;
  final VoidCallback onPressed;
  final List<PosData> posList;

  @override
  DataRow getRow(int index) {
    return DataRow2(
      cells: [
        if (index != 0)
          DataCell.empty
        else
          DataCell(
            Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    child: AppImageWidget(
                      appFile: AppFile(
                        bytes: null,
                        name: null,
                        extension: '',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Filiale Fulda'),
                      const Text('Hauptstraße 1, 36037 Fulda'),
                    ],
                  ),
                )
              ],
            ),
          ),
        DataCell(
          Text('${posList[index].id}'),
        ),
        DataCell(
          Text('${posList[index].name}'),
        ),
        DataCell(
          Text('${posList[index].manufacturer}'),
        ),
        DataCell(
          Text('${posList[index].model}'),
        ),
        DataCell(
          Text('${posList[index].id}'),
        ),
        DataCell(
          Text(posList[index].isActive ? 'Aktiv' : 'Nicht aktiv'),
        ),
        const DataCell(
          Text('ACtion'),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => posList.length;

  @override
  int get selectedRowCount => 0;
}
