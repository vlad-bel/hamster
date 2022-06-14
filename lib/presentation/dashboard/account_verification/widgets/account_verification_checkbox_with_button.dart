import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
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
            title: Text(
              AppLocale.of(context).i_certify_info_correct,
              style: inter12,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 25),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ActionButtonBlue(
              onPressed: () {
                SnackBarManager.showSuccess(
                  AppLocale.of(context).verifikation_wip,
                );
              },
              isEnabled: isActionButtonEnabled(form),
              width: 580,
              child: Text(
                AppLocale.of(context).request_verification.toUpperCase(),
              ),
            );
          },
        ),
      ],
    );
  }

  bool isActionButtonEnabled(FormGroup form) => form.valid && isFullyCompleted;
}
