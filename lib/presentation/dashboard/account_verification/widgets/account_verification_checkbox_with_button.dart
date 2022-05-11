import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/cubit/account_verification_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountVerificationCheckboxWithButton extends StatelessWidget {
  const AccountVerificationCheckboxWithButton({
    Key? key,
    required this.isAcceptedDataIsCorrect,
  }) : super(key: key);

  final bool isAcceptedDataIsCorrect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            onChanged: (value) => onChangeCheckBox(context, value: value),
          ),
        ),
        const SizedBox(height: 25),
        ActionButtonBlue(
          onPressed: () {
            SnackBarManager.showSuccess(
              'Verifikation feature is work in progress',
            );
          },
          isEnabled: isAcceptedDataIsCorrect,
          width: 580,
          child: const Text('VERIFIKATION BEANTRAGEN'),
        ),
      ],
    );
  }

  void onChangeCheckBox(BuildContext context, {required bool? value}) {
    context.read<AccountVerificationCubit>().changeCheckBoxDataIsCorrect(
          isAcceptedDataIsCorrect: value ?? false,
        );
  }
}