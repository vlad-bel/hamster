import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/profile_view_table.dart';
import 'package:business_terminal/presentation/common/widgets/profile_view_table/widget/profile_view_table_row.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/view/profile_edit.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/profile_view_container.dart';
import 'package:flutter/material.dart';

class CompanyProfileTable extends StatelessWidget {
  const CompanyProfileTable({
    super.key,
    required this.repCompany,
  });

  final RepCompany repCompany;

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
              onPressed: () {
                authNavigatorKey.currentState?.pushNamed(ProfileEditPage.path);
              },
              companies: [
                repCompany,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
