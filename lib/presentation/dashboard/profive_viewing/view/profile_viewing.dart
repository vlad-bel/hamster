import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/cubit/profile_viewing_cubit.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/view/company_branch_table.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/view/company_profile_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocProvider(
        create: (BuildContext context) {
          return getIt.get<ProfileViewingCubit>()..getInitialData();
        },
        child: BlocBuilder<ProfileViewingCubit, ProfileViewingState>(
          buildWhen: (previous, current) {
            return current is SuccessProfileViewingState ||
                current is LoadingProfileViewingState;
          },
          builder: (context, state) {
            return state.when(
              error: (error) {
                return SizedBox.shrink();
              },
              success: (company) {
                return Column(
                  children: [
                    CompanyProfileTable(
                      repCompany: company,
                    ),
                    const SizedBox(height: 25),
                    const CompanyBranchTable(),
                  ],
                );
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              initial: () {
                return SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
