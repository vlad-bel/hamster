import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_data_form.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_profile_working_hours_table.dart';
import 'package:business_terminal/presentation/branch_profile/widget/branch_top_photo_and_logo_pager.dart';
import 'package:business_terminal/presentation/common/widgets/branch_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfilePage extends StatelessWidget {
  const BranchProfilePage({Key? key}) : super(key: key);

  static const path = '/branch_profile';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<CountrySelectorCubit>()..getCountryList(),
        )
      ],
      child: _BranchProfileView(),
    );
  }
}

class _BranchProfileView extends StatelessWidget {
  _BranchProfileView({Key? key}) : super(key: key);

  final formSettings = BranchProfileFormValidation();

  final verticalPaddingBetweenTextInputs = 18.0;

  @override
  Widget build(BuildContext context) {
    final countrySelectorCubit = BlocProvider.of<CountrySelectorCubit>(context);

    final paddingBetweenTextInputs = SizedBox(
      height: verticalPaddingBetweenTextInputs,
    );

    return OnboardingBackground(
      children: Column(
        children: [
          BranchProfileContainerWhite(
            headerLeft: Text(LocaleKeys.branch_profile).tr(),
            headerRight: Text(LocaleKeys.branch_id.tr(args: ['0001'])),
            body: Column(
              children: [
                BranchTopPhotoAndLogoPager(),
                SizedBox(height: 26),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Left side part:
                    BranchDataForm(
                      formSettings: formSettings,
                      paddingBetweenTextInputs: paddingBetweenTextInputs,
                      countrySelectorCubit: countrySelectorCubit,
                    ),

                    SizedBox(width: 45),

                    /// Right side part:
                    Expanded(child: BranchProfileWorkingHoursTable()),
                  ],
                ),
              ],
            ),
          ),

          // Branch category:
          SizedBox(height: 16),
          BranchProfileContainerWhite(
            headerLeft: Text(LocaleKeys.branch_category).tr(),
            body: Container(height: 45, color: denim.withOpacity(0.2)),
          ),

          // Branch equipment:
          SizedBox(height: 16),
          BranchProfileContainerWhite(
            headerLeft: Text(LocaleKeys.branch_equipment).tr(),
            body: Container(height: 45, color: denim.withOpacity(0.2)),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
