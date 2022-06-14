import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/cubit/account_verification_cubit.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/form_validation/dashboard_form_validation.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/widgets/account_verification_checkbox_with_button.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/widgets/account_verification_title_subtitle.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/widgets/dashboard_profile_feelup_percents_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/utils/l10n/l10n_service.dart';

class DashboardAccountVerificationPage extends StatelessWidget {
  const DashboardAccountVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<AccountVerificationCubit>()..getRepCompanyData(),
      child: _AccountVerificationView(),
    );
  }
}

class _AccountVerificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: solitude1,
      child: Center(
        child: BlocBuilder<AccountVerificationCubit, VerifyAccountState>(
          builder: (context, state) {
            return state.when(
              initial: (
                isFullyCompleted,
                progressUserAccount,
                progressCompanyProfile,
                progressBranchProfile,
              ) =>
                  _AccountVerificationContent(
                isFullyCompleted: isFullyCompleted,
                progressUserAccount: progressUserAccount,
                progressCompanyProfile: progressCompanyProfile,
                progressBranchProfile: progressBranchProfile,
              ),
              error: (ApiFailure error) {
                return _AccountVerificationContent();
              },
            );
          },
        ),
      ),
    );
  }
}

class _AccountVerificationContent extends StatelessWidget {
  _AccountVerificationContent({
    this.isAcceptedDataIsCorrect,
    this.isFullyCompleted,
    this.progressUserAccount,
    this.progressCompanyProfile,
    this.progressBranchProfile,
  });

  final bool? isAcceptedDataIsCorrect;
  final bool? isFullyCompleted;
  final int? progressUserAccount;
  final int? progressCompanyProfile;
  final int? progressBranchProfile;

  final formSettings = DashboardFormValidation();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AccountVerificationTitleSubtitle(),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressUserAccount,
              imagePath: Assets.imagesUserAccount,
              title: AppLocale.of(context).user_account,
              subTitle: AppLocale.of(context).create_user_account_subtitle,
              onPressed: () {
                SnackBarManager.showSuccess(
                  AppLocale.of(context).nutzeraccount_wip,
                );
              },
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressCompanyProfile,
              imagePath: Assets.imagesCompanyProfile,
              title: AppLocale.of(context).company_profile,
              subTitle: AppLocale.of(context).complete_your_company_profile,
              onPressed: () {
                SnackBarManager.showSuccess(
                  AppLocale.of(context).unternehmensprofil_wip,
                );
              },
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressBranchProfile,
              imagePath: Assets.imagesBranchProfile,
              title: AppLocale.of(context).branch_profile,
              subTitle: AppLocale.of(context).complete_at_least_one_branch,
              onPressed: () {
                SnackBarManager.showSuccess(
                  AppLocale.of(context).filialprofil_wip,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 45),
        ReactiveFormBuilder(
          form: formSettings.buildForm,
          builder: (
            BuildContext context,
            FormGroup formGroup,
            Widget? child,
          ) {
            return AccountVerificationCheckboxWithButton(
              checkboxName: DashboardFormValidation.acceptCheckBox,
              formGroup: formGroup,
              isFullyCompleted: isFullyCompleted ?? false,
            );
          },
        ),
      ],
    );
  }
}
