import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/widget/list.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_page.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBranchProfileCheckboxesPage extends StatelessWidget {
  const CreateBranchProfileCheckboxesPage({
    Key? key,
    required this.repCompany,
  }) : super(key: key);

  final RepCompany repCompany;

  static const String path = '/create_branch_profile_checkboxes_page';
  static const String paramRepCompany = 'company';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CreateBranchProfileCheckboxesCubit>(),
      child: CreateBranchProfileCheckboxesView(company: repCompany),
    );
  }
}

class CreateBranchProfileCheckboxesView extends StatelessWidget {
  const CreateBranchProfileCheckboxesView({Key? key, required this.company})
      : super(key: key);

  final RepCompany company;

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).add_details,
          subHeader: Text(AppLocale.of(context).if_identical_addresses),
        ),
        body: BlocBuilder<CreateBranchProfileCheckboxesCubit,
            CreateBranchProfileCheckboxesState>(
          builder: (context, state) {
            return state.whenOrNull(
                  initial: (data) {
                    return Column(
                      children: [
                        SizedBox(height: 25),

                        // Listview with checkboxes:
                        BranchProfileDataCheckBoxesList(
                          data,
                          company: company,
                        ),
                        SizedBox(height: 25),

                        // Bottom action buttons:
                        Row(
                          children: [
                            WhiteButton(
                              onPressed: () => onPressGoBack(context),
                            ),
                            Spacer(),
                            ActionButtonBlue(
                              isEnabled: true,
                              onPressed: () {
                                onPressedGoToNextPage(context, company, data);
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ) ??
                CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  void onPressedGoToNextPage(
    BuildContext context,
    RepCompany company,
    CreateBranchProfileCheckboxesData data,
  ) {
    context.read<BranchProfileCubit>().clearData();
    Navigator.of(context).pushNamed(
      BranchProfilePage.path,
      arguments: {
        BranchProfilePage.paramCompany: company,
        BranchProfilePage.paramData: data,
      },
    );
  }

  void onPressGoBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
