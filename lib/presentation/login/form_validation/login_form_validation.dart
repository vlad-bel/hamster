import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginFormSettings {
  static const kMaxLength = 256;
  static const kMinLengthPassword = 9;

  final kFieldEmail = 'email';
  final kFieldPassword = 'password';

  Map<String, String> validationMessageEmail(BuildContext context) => {
        ValidationMessage.required: AppLocale.current.not_empty_field,
        ValidationMessage.email: AppLocale.current.email_field,
        ValidationMessage.maxLength: AppLocale.current.max_number(kMaxLength),
      };

  Map<String, String> validationMessagePassword(BuildContext context) => {
        ValidationMessage.required: AppLocale.of(context).not_empty_field,
        ValidationMessage.maxLength:
            AppLocale.of(context).max_number(kMinLengthPassword),
        ValidationMessage.minLength:
            AppLocale.of(context).min_number(kMinLengthPassword),
      };

  FormGroup buildForm() {
    return FormGroup({
      kFieldEmail: FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
          Validators.maxLength(kMaxLength)
        ],
      ),
      kFieldPassword: FormControl<String>(
        validators: [
          Validators.required,
          Validators.maxLength(kMaxLength),
          Validators.minLength(kMinLengthPassword)
        ],
      ),
    });
  }
}
