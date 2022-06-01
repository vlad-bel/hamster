import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/company_branch_table_with_data.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/widget/profile_view_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyBranchTable extends StatelessWidget {
  const CompanyBranchTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileViewContainer(
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return state.when(
            init: (state) {
              // TODO: fetch branchProfile and put here
              return CompanyBranchTableWithData(
                repCompany: state.repCompany,
                branchProfile: state.branchProfilesList,
              );
            },
            error: error,
          );
        },
      ),
    );
  }

  Widget error(testCount, finansenOpen, administrationOpen, repCompany) {
    return Center(child: Text('CompanyBranchTable -> DashboardCubit Error'));
  }
}
