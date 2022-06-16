import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/branch_profile_table/company_branch_table_with_data.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/profile_view_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileTable extends StatelessWidget {
  const BranchProfileTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileViewContainer(
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return state.when(
            init: (state) {
              return BranchProfileTableWithData(
                repCompany: state.repCompany,
                branchProfiles: state.branchProfilesList,
              );
            },
            error: error,
          );
        },
      ),
    );
  }

  Widget error(testCount, finansenOpen, administrationOpen, repCompany) {
    return const Center(
        child: Text('CompanyBranchTable -> DashboardCubit Error'));
  }
}
