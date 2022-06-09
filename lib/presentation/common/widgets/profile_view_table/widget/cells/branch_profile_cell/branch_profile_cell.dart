import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/cells/company_cell/company_data_cell.dart';
import 'package:flutter/material.dart';

class BranchProfileCell extends StatelessWidget {
  const BranchProfileCell({
    Key? key,
    required this.repCompany,
  }) : super(key: key);

  // TODO: repCompany -> BranchProfile
  final RepCompany repCompany;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CompanyCellAvatar(),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                repCompany.company?.companyName ?? '',
                style: inter14Medium,
              ),
              Text(
                repCompany.getFullAddress(),
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
