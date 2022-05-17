import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/profile_view_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_row.dart';
import 'package:flutter/material.dart';

class ProfileViewing extends StatelessWidget {
  const ProfileViewing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: solitude1,
      padding: const EdgeInsets.all(25),
      child: const Center(
        child: CompanyProfileView(),
      ),
    );
  }
}

class CompanyProfileView extends StatelessWidget {
  const CompanyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: white,
          padding: const EdgeInsets.symmetric(
            vertical: 46,
            horizontal: 50,
          ),
          child: ProfileViewTable(
            source: ProfileViewTableSource(
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
        ),
      ],
    );
  }
}
