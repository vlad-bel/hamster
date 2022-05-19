import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/profile_view_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/control_panel/branch_table_control_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_table_row.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/profile_view_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CompanyBranchTable extends StatelessWidget {
  const CompanyBranchTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileViewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BranchTableControlPanel(),
          ProfileViewTable(
            sortable: true,
            row: ProfileViewTableRow(
              companies: [
                ///TODO remove mock data
                ///get companies from backend
                RepCompany(
                  rep: Rep(
                    name: 'test',
                    avatar: '',
                    surname: 'test',
                    fillingProgress: 1,
                  ),
                  company: Company(
                    companyName: "Testcompany",
                    streetName: "Streetname",
                    streetNumber: '1',
                    postalCode: '36037',
                    city: 'Fulda',
                  ),
                  branch: Branch(
                    fillingProgress: 1,
                  ),
                ),
                RepCompany(
                  rep: Rep(
                    name: 'test1',
                    avatar: '',
                    surname: 'test1',
                    fillingProgress: 1,
                  ),
                  company: Company(
                    companyName: "Testcompany1",
                    streetName: "Streetname1",
                    streetNumber: '2',
                    postalCode: '36038',
                    city: 'Berlin',
                  ),
                  branch: Branch(
                    fillingProgress: 2,
                  ),
                ),
                RepCompany(
                  rep: Rep(
                    name: 'test1',
                    avatar: '',
                    surname: 'test1',
                    fillingProgress: 1,
                  ),
                  company: Company(
                    companyName: "Testcompany1",
                    streetName: "Streetname1",
                    streetNumber: '2',
                    postalCode: '36038',
                    city: 'Berlin',
                  ),
                  branch: Branch(
                    fillingProgress: 2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          DashedButton(
            onTap: () {},
            label: tr('add_branch'),
          ),
        ],
      ),
    );
  }
}
