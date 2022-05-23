import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/view/company_branch_table.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/view/company_profile_table.dart';
import 'package:flutter/material.dart';

class ProfileViewing extends StatelessWidget {
  const ProfileViewing({super.key});

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
  const CompanyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CompanyProfileTable(),
          SizedBox(height: 25),
          CompanyBranchTable(),
        ],
      ),
    );
  }
}
