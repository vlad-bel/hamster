import 'dart:ui';

import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_image_widget.dart';
import 'package:business_terminal/presentation/dashboard/pos_overview/widget/pos_active_status_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

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
                      Text('${branchProfile.branchName}'),
                      Text(branchProfile.getFullAddress()),
                    ],
                  ),
                )
              ],
            ),
          ),
        DataCell(
          Text(posList[index].id),
        ),
        DataCell(
          Text(posList[index].name),
        ),
        DataCell(
          Text(posList[index].manufacturer),
        ),
        DataCell(
          Text(posList[index].model),
        ),
        DataCell(
          Row(
            children: [
              Text(
                '${posList[index].id.substring(0, 4)}****...',
                style: inter14.copyWith(
                  fontFeatures: const [
                    FontFeature.tabularFigures(),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.copy,
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
        ),
        DataCell(
          PosActiveStatusWidget(
            isActive: posList[index].isActive,
          ),
        ),
        DataCell(
          Row(
            children: const [
              Icon(
                Icons.edit,
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.ios_share_rounded,
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.close,
              ),
            ],
          ),
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
