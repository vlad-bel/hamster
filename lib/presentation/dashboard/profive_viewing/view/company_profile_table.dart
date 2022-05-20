import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/profile_view_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_table_row.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/profile_view_container.dart';
import 'package:flutter/material.dart';

class CompanyProfileTable extends StatelessWidget {
  const CompanyProfileTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileViewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.of(context).company_profile,
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
                    companyName: 'Testcompany',
                    streetName: 'Streetname',
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
