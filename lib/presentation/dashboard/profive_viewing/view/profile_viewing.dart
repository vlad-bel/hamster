import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/branch_profile_table/company_branch_table.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/cubit/profile_viewing_cubit.dart';
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

class CompanyProfileView extends StatefulWidget {
  const CompanyProfileView({super.key});

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = context.read<ProfileViewingCubit>()..getInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ProfileViewingCubit, ProfileViewingState>(
        buildWhen: (previous, current) {
          return current is SuccessProfileViewingState ||
              current is LoadingProfileViewingState;
        },
        builder: (context, state) {
          return state.when(
            error: (error) {
              return const SizedBox.shrink();
            },
            success: (repCompany, company) {
              return Column(
                children: [
                  CompanyProfileTable(
                    repCompany: repCompany,
                    company: company,
                  ),
                  const SizedBox(height: 25),
                  const BranchProfileTable(),
                ],
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            initial: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
