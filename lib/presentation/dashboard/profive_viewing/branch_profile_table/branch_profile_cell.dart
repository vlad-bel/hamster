import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/logo.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/company_cell/company_data_cell.dart';
import 'package:flutter/material.dart';

class BranchProfileCell extends StatelessWidget {
  const BranchProfileCell({
    Key? key,
    required this.branch,
  }) : super(key: key);

  final BranchProfile branch;

  @override
  Widget build(BuildContext context) {
    // TODO: replace with - branch.logos (when logos are available)
    final logos = <CompanyLogo>[
      CompanyLogo(
        fileName: 'https://www.pngwing.com/de/free-png-ztplp',
        backgroundColor: '#FAFAFA',
      )
    ];

    return Row(
      children: [
        CompanyCellAvatar(imagePath: logos),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                branch.branchName ?? '',
                style: inter14Semibold,
              ),
              Text(
                branch.getFullAddress(),
                style: inter14,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
