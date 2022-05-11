import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/cubit/account_verification_cubit.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/widgets/account_verification_checkbox_with_button.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/widgets/account_verification_title_subtitle.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/widgets/dashboard_profile_feelup_percents_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardAccountVerificationPage extends StatelessWidget {
  const DashboardAccountVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<AccountVerificationCubit>(),
      child: const _AccountVerificationView(),
    );
  }
}

class _AccountVerificationView extends StatelessWidget {
  const _AccountVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: solitude1,
      child: Center(
        child: BlocBuilder<AccountVerificationCubit, VerifyAccountState>(
          builder: (context, state) {
            return state.when(
              initial: (
                isAcceptedDataIsCorrect,
                progressUserAccount,
                progressCompanyProfile,
                progressBranchProfile,
              ) =>
                  _AccountVerificationContent(
                isAcceptedDataIsCorrect: isAcceptedDataIsCorrect,
                progressUserAccount: progressUserAccount,
                progressCompanyProfile: progressCompanyProfile,
                progressBranchProfile: progressBranchProfile,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AccountVerificationContent extends StatelessWidget {
  const _AccountVerificationContent({
    Key? key,
    required this.isAcceptedDataIsCorrect,
    required this.progressUserAccount,
    required this.progressCompanyProfile,
    required this.progressBranchProfile,
  }) : super(key: key);

  final bool isAcceptedDataIsCorrect;
  final int progressUserAccount;
  final int progressCompanyProfile;
  final int progressBranchProfile;

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
              subTitle:
                  'Erstellen Sie einen Nutzeraccount, um einen Zugang zum BusinessTerminal zu erhalten und damit Hamster zu nutzen.',
              onPressed: () {
                SnackBarManager.showSuccess(
                    'Nutzeraccount feature is work in progress');
              },
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressCompanyProfile,
              imagePath: Assets.imagesCompanyProfile,
              title: 'Unternehmensprofil',
              subTitle:
                  'Vervollständigen Sie Ihr Unternehmensprofil, damit wir Sie verifizieren können.',
              onPressed: () {
                SnackBarManager.showSuccess(
                    'Unternehmensprofil feature is work in progress');
              },
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressBranchProfile,
              imagePath: Assets.imagesBranchProfile,
              title: 'Filialprofil',
              subTitle:
                  'Vervollständigen Sie mindestens ein Filialprofil, welches Ihren Kunden in der HamsterApp angezeigt wird.',
              onPressed: () {
                SnackBarManager.showSuccess(
                    'Filialprofil feature is work in progress');
              },
            ),
          ],
        ),
        const SizedBox(height: 45),
        AccountVerificationCheckboxWithButton(
          isAcceptedDataIsCorrect: isAcceptedDataIsCorrect,
        ),
      ],
    );
  }
}
