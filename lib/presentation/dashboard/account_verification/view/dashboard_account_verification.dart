import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/cubit/account_verification_cubit.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/widgets/dashboard_profile_feelup_percents_box.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountVerificationPage extends StatelessWidget {
  const AccountVerificationPage({Key? key}) : super(key: key);

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
              initial: (isAcceptedDataIsCorrect,
                  progressUserAccount,
                  progressCompanyProfile,
                  progressBranchProfile,) =>
                  _AccountVerificationContent(
                    isAcceptedDataIsCorrect: isAcceptedDataIsCorrect,
                    progressUserAccount: progressUserAccount,
                    progressCompanyProfile: progressCompanyProfile,
                    progressBranchProfile: progressBranchProfile,
                  ),
            )
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
        Text(
          'Ein paar Informationen fehlen uns noch',
          style: inter20,
        ),
        const SizedBox(height: 30),
        Text(
          'Die drei nachfolgenden Bedingungen müssen erfüllt sein bevor Sie die Verifikation Ihres Unternehmens mit den'
              '\ndazugehörigen Filialen beantragen können, um in der HamsterApp aufgeführt zu werden.',
          style: inter14,
          textAlign: TextAlign.center,
        ),
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
              onPressed: () {},
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressCompanyProfile,
              imagePath: Assets.imagesCompanyProfile,
              title: 'Unternehmensprofil',
              subTitle:
              'Vervollständigen Sie Ihr Unternehmensprofil, damit wir Sie verifizieren können.',
              onPressed: () {},
            ),
            const SizedBox(width: 24),
            DashboardProfileFeelUpPercentsBox(
              percentsProgress: progressBranchProfile,
              imagePath: Assets.imagesBranchProfile,
              title: 'Filialprofil',
              subTitle:
              'Vervollständigen Sie mindestens ein Filialprofil, welches Ihren Kunden in der HamsterApp angezeigt wird.',
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 45),
        SizedBox(
          width: 588,
          child: CheckboxListTile(
            value: isAcceptedDataIsCorrect,
            title: Text(
              'Hiermit versichere ich, dass alle von mir getätigten Angaben vollständig und korrekt sind. ',
              style: inter12,
              textAlign: TextAlign.center,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              context
                  .read<AccountVerificationCubit>()
                  .changeCheckBoxDataIsCorrect(
                isAcceptedDataIsCorrect: value ?? false,
              );
            },
          ),
        ),
        const SizedBox(height: 25),
        ActionButtonBlue(
          onPressed: () {},
          isEnabled: isAcceptedDataIsCorrect,
          width: 580,
          child: const Text('VERIFIKATION BEANTRAGEN'),
        ),
      ],
    );
  }
}
