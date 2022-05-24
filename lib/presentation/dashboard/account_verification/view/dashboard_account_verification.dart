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
    super.key,
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
              title: 'Nutzeraccount',
              subTitle: 'Erstellen Sie einen Nutzeraccount, um einen'
                  ' Zugang zum BusinessTerminal zu erhalten und damit'
                  ' Hamster zu nutzen.',
              onPressed: () {
                SnackBarManager.showSuccess(
                  'Nutzeraccount feature is work in progress',
                );
              },
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressCompanyProfile,
              imagePath: Assets.imagesCompanyProfile,
              title: 'Unternehmensprofil',
              subTitle: 'Vervollständigen Sie Ihr Unternehmensprofil, damit wir'
                  ' Sie verifizieren können.',
              onPressed: () {
                SnackBarManager.showSuccess(
                  'Unternehmensprofil feature is work in progress',
                );
              },
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressBranchProfile,
              imagePath: Assets.imagesBranchProfile,
              title: 'Filialprofil',
              subTitle: 'Vervollständigen Sie mindestens ein Filialprofil,'
                  ' welches Ihren Kunden in der HamsterApp angezeigt wird.',
              onPressed: () {
                SnackBarManager.showSuccess(
                  'Filialprofil feature is work in progress',
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
              isFullyCompleted: true, //isFullyCompleted ?? false,
            );
          },
        ),
      ],
    );
  }
}
