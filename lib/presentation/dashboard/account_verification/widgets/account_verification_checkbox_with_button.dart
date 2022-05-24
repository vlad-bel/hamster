import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/checkbox/ui_checkbox.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AccountVerificationCheckboxWithButton extends StatelessWidget {
  const AccountVerificationCheckboxWithButton({
    super.key,
    required this.isFullyCompleted,
    required this.checkboxName,
    required this.formGroup,
  });

  final String checkboxName;
  final FormGroup formGroup;
  final bool isFullyCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 588,
          child: UiCheckbox(
            name: checkboxName,
            //onChanged: (value) => onChangeCheckBox(context, value: value),
            title: Text(
              'Hiermit versichere ich, dass alle von mir getätigten'
              ' Angaben vollständig und korrekt sind.',
              style: inter12,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 25),
        ActionButtonBlue(
          onPressed: () {
            SnackBarManager.showSuccess(
              'Verifikation feature is work in progress',
            );
          },
          isEnabled: formGroup.valid,
          width: 580,
          child: const Text('VERIFIKATION BEANTRAGEN'),
        ),
      ],
    );
  }
}
