import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/profile_view_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_table_row.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/profile_view_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CompanyProfileTable extends StatelessWidget {
  const CompanyProfileTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileViewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('company_profile'),
            style: inter16SemiBold,
          ),
          const SizedBox(height: 32),
          ProfileViewTable(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
