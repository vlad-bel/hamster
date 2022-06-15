import 'dart:ui';

import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile_with_paging.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/header_cell/header_cell.dart';
import 'package:business_terminal/presentation/dashboard/pos_overview/cubit/pos_overview_cubit.dart';
import 'package:business_terminal/presentation/dashboard/pos_overview/cubit/pos_overview_state.dart';
import 'package:business_terminal/presentation/dashboard/pos_overview/widget/pos_overview_row_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PosOverviewView extends StatelessWidget {
  const PosOverviewView({Key? key}) : super(key: key);

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
          child: BlocProvider(
            create: (BuildContext context) {
              return getIt.get<PosOverviewCubit>()..getData();
            },
            child: BlocBuilder<PosOverviewCubit, PosOverviewState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  success: (
                    BranchProfileWithPaging branchProfileWithPaging,
                  ) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocale.of(context).branches,
                              style: inter16SemiBold,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: branchProfileWithPaging
                                          .hasPreviousPage
                                      ? () {
                                          context
                                              .read<PosOverviewCubit>()
                                              .getData(
                                                page: branchProfileWithPaging
                                                        .page -
                                                    1,
                                              );
                                        }
                                      : null,
                                  child: const Text('<'),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${branchProfileWithPaging.page} / ${branchProfileWithPaging.pageCount}',
                                  style: inter14.copyWith(
                                    fontFeatures: const [
                                      FontFeature.tabularFigures(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                  onPressed: branchProfileWithPaging.hasNextPage
                                      ? () {
                                          context
                                              .read<PosOverviewCubit>()
                                              .getData(
                                                page: branchProfileWithPaging
                                                        .page +
                                                    1,
                                              );
                                        }
                                      : null,
                                  child: const Text('>'),
                                ),
                                const Icon(Icons.search),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Icon(Icons.filter_alt),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 50),
                        Expanded(
                          child: DataTable2(
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
                                color: lynch.withOpacity(0),
                              ),
                            ),
                            dataRowHeight: 76,
                            headingRowHeight: 48,
                            onSelectAll: (value) {},
                            horizontalMargin: 0,
                            showCheckboxColumn: false,
                            columnSpacing: 16,
                            lmRatio: 1.5,
                            columns: [
                              DataColumn2(
                                size: ColumnSize.L,
                                label: HeaderCell(
                                  name: AppLocale.of(context)
                                      .branches
                                      .toUpperCase(),
                                  sortable: true,
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: HeaderCell(
                                  name: AppLocale.of(context)
                                      .number
                                      .toUpperCase(),
                                  sortable: true,
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: HeaderCell(
                                  name: AppLocale.of(context)
                                      .description
                                      .toUpperCase(),
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: HeaderCell(
                                  name: AppLocale.of(context)
                                      .manufacturer
                                      .toUpperCase(),
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: HeaderCell(
                                  name:
                                      AppLocale.of(context).model.toUpperCase(),
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: HeaderCell(
                                  name: AppLocale.of(context).pos_identifier,
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: HeaderCell(
                                  name: AppLocale.of(context).connection,
                                ),
                              ),
                              DataColumn2(
                                size: ColumnSize.S,
                                label: HeaderCell(
                                  name: AppLocale.of(context).action,
                                ),
                              ),
                            ],
                            rows: [
                              for (final BranchProfile data
                                  in branchProfileWithPaging.data)
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
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
