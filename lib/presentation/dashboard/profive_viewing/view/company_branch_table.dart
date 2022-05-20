import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_page.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/profile_view_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/control_panel/branch_table_control_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_table_row.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/profile_view_container.dart';
import 'package:flutter/material.dart';

class CompanyBranchTable extends StatelessWidget {
  const CompanyBranchTable({super.key});

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
                    companyName: 'Testcompany',
                    streetName: 'Streetname',
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
                    companyName: 'Testcompany1',
                    streetName: 'Streetname1',
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
                    companyName: 'Testcompany1',
                    streetName: 'Streetname1',
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
            onTap: () {
              authNavigatorKey.currentState?.pushNamed(BranchProfilePage.path);
            },
            label: AppLocale.of(context).add_branch,
          ),
        ],
      ),
    );
  }
}
