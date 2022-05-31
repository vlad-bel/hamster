import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_categories.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_data_form.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_profile_working_hours_table.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_top_photo_and_logo_pager.dart';
import 'package:business_terminal/presentation/branch_profile/widget/pos_list_item.dart';
import 'package:business_terminal/presentation/common/widgets/branch_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dash_bordered_container/dash_bordered_container_widget.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfilePage extends StatelessWidget {
  const BranchProfilePage({
    required this.company,
    required this.branchSelectedFieldsMap,
    super.key,
  });

  static const path = '/branch_profile';
  static const paramCompany = 'company';
  static const paramData = 'data';

  final CreateBranchProfileCheckboxesData branchSelectedFieldsMap;
  final RepCompany company;

  @override
  Widget build(BuildContext context) {
    context.read<CountrySelectorCubit>().getCountryList();
    return _BranchProfileView(company, branchSelectedFieldsMap);
  }
}

class _BranchProfileView extends StatelessWidget {
  _BranchProfileView(this.company, this.branchSelectedFieldsMap, {super.key});

  final CreateBranchProfileCheckboxesData branchSelectedFieldsMap;
  final RepCompany company;

  final formSettings = BranchProfileFormValidation();
  final verticalPaddingBetweenTextInputs = 18.0;

  @override
  Widget build(BuildContext context) {
    final paddingBetweenTextInputs = SizedBox(
      height: verticalPaddingBetweenTextInputs,
    );

    return BlocBuilder<BranchProfileCubit, BranchProfileState>(
      builder: (BuildContext context, state) {
        return OnboardingBackground(
          children: Column(
            children: [
              BranchProfileContainerWhite(
                headerLeft: Text(AppLocale.of(context).branch_profile),
                headerRight: Text(
                  AppLocale.of(context).branch_id(0001),
                ),
                body: Column(
                  children: [
                    BranchTopPhotoAndLogoPager(),
                    const SizedBox(height: 26),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Left side part:
                        BranchDataForm(
                          formSettings: formSettings,
                          paddingBetweenTextInputs: paddingBetweenTextInputs,
                          branchSelectedFieldsMap: branchSelectedFieldsMap,
                          company: company,
                        ),
                        const SizedBox(width: 45),

                        /// Right side part:
                        Expanded(child: BranchProfileWorkingHoursTable()),
                      ],
                    ),
                  ],
                ),
              ),
              // Branch category:
              const SizedBox(height: 16),
              BranchProfileContainerWhite(
                headerLeft: Text(AppLocale.of(context).branch_category),
                body: BranchProfileCategories(),
              ),
              // Branch equipment:
              const SizedBox(height: 16),
              BranchProfileContainerWhite(
                headerLeft: Text(AppLocale.of(context).branch_equipment),
                body: Column(
                  children: [
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PosListItem(
                          index: index,
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    AppDashBorderedContainer(
                      borderType: BorderType.rect,
                      dashColor: white,
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle,
                              color: denim1,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              AppLocale.of(context).add_bank_details,
                              style: inter14.copyWith(
                                color: denim1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}
