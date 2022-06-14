import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/temp/pos_raw.dart';
import 'package:business_terminal/presentation/add_pos/view/add_pos_page.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_categories.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_data_form.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_profile_working_hours_table.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_top_photo_and_logo_pager.dart';
import 'package:business_terminal/presentation/branch_profile/widget/pos_list_item.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/branch_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/header_app_bar/header_app_bar_widget.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BranchProfilePage extends StatelessWidget {
  const BranchProfilePage({
    required this.company,
    required this.branchSelectedFieldsMap,
    super.key,
  });

  static const paramCompany = 'company';
  static const paramData = 'data';
  static const path = '/branch_profile';

  final CreateBranchProfileCheckboxesData branchSelectedFieldsMap;
  final RepCompany company;

  @override
  Widget build(BuildContext context) {
    context.read<CountrySelectorCubit>().getCountryList();
    return _BranchProfileView(company, branchSelectedFieldsMap);
  }
}

class _BranchProfileView extends StatefulWidget {
  const _BranchProfileView(
    this.company,
    this.branchSelectedFieldsMap,
  );

  final CreateBranchProfileCheckboxesData branchSelectedFieldsMap;
  final RepCompany company;

  @override
  State<_BranchProfileView> createState() => _BranchProfileViewState();
}

class _BranchProfileViewState extends State<_BranchProfileView> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<BranchProfileAvatarPictureCubit>();
    cubit.loadInitData();
  }

  @override
  Widget build(BuildContext context) {
    const paddingBetweenTextInputs = SizedBox(height: 18);

    return BlocConsumer<BranchProfileCubit, BranchProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          branchWasCreatedSuccessfully: (
            category,
            subcategories,
            branchImages,
            avatarImages,
            poses,
            hours,
            isCreateBranchButtonEnabled,
          ) {
            Navigator.popUntil(
              context,
              (route) => route.settings.name == DashboardPage.path,
            );
          },
        );
      },
      builder: (BuildContext context, state) {
        return OnboardingBackground(
          customAppBar: const BranchProfileAppBar(),
          children: Column(
            children: [
              BranchProfileContainerWhite(
                headerLeft: Text(AppLocale.of(context).branch_profile),
                headerRight: Text(
                  AppLocale.of(context).branch_id(0001),
                ),
                body: Column(
                  children: [
                    const BranchTopPhotoAndLogoPager(),
                    const SizedBox(height: 26),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Left side part:
                        BranchDataForm(
                          formGroup:
                              context.read<BranchProfileCubit>().formGroup,
                          paddingBetweenTextInputs: paddingBetweenTextInputs,
                          branchSelectedFieldsMap:
                              widget.branchSelectedFieldsMap,
                          company: widget.company,
                        ),
                        const SizedBox(width: 45),

                        /// Right side part:
                        Expanded(
                          child: BranchProfileWorkingHoursTable(
                            state: state as InitBranchProfileState,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Branch category:
              const SizedBox(height: 16),
              BranchProfileContainerWhite(
                headerLeft: Text(AppLocale.of(context).branch_category),
                body: const BranchProfileCategories(),
              ),

              // Branch equipment:
              const SizedBox(height: 16),
              PosDataLayout(state: state),
              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}

class PosDataLayout extends StatelessWidget {
  const PosDataLayout({
    required this.state,
    Key? key,
  }) : super(key: key);

  final InitBranchProfileState state;

  @override
  Widget build(BuildContext context) {
    return BranchProfileContainerWhite(
      headerLeft: Text(AppLocale.of(context).branch_equipment),
      body: Column(
        children: [
          ListView.builder(
            itemCount: state.poses?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final pos = (state.poses)?[index];
              if (pos == null) return const SizedBox.shrink();

              return PosListItem(
                tillCount: pos.tillCount,
                manufacturer: pos.manufacturer,
                model: pos.model,
              );
            },
          ),
          const SizedBox(height: 32),
          DashedButton(
            onTap: () async {
              final pos = await Navigator.of(context).pushNamed(AddPosPage.path)
                  as PosRaw?;

              context.read<BranchProfileCubit>().addPos(pos: pos);
            },
            label: AppLocale.of(context).add_pos,
          ),
        ],
      ),
    );
  }
}

class BranchProfileAppBar extends StatelessWidget {
  const BranchProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 46),
      child: BlocBuilder<BranchProfileCubit, BranchProfileState>(
        builder: (context, state) {
          return state.whenOrNull(
                init: (
                  category,
                  subcategories,
                  branchImages,
                  avatarImages,
                  poses,
                  hours,
                  isCreateBranchButtonEnabled,
                ) {
                  return ReactiveFormBuilder(
                    form: () => context.read<BranchProfileCubit>().formGroup,
                    builder: (context, form, child) {
                      return HeaderAppBarWidget(
                        trailing: ActionButtonBlue(
                          isEnabled: form.valid,
                          child: Text(
                            AppLocale.of(context).save.toUpperCase(),
                          ),
                          onPressed: () {
                            final countrySelected = context
                                .read<CountrySelectorCubit>()
                                .countryForm
                                .control(
                                  CountrySelectorCubit.countryField,
                                )
                                .value as String?;

                            context
                                .read<BranchProfileCubit>()
                                .createBranch(countrySelected);
                          },
                        ),
                      );
                    },
                  );
                },
              ) ??
              Text(AppLocale.of(context).error);
        },
      ),
    );
  }
}