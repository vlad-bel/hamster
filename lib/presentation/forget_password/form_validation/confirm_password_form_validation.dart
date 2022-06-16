import 'package:business_terminal/app/utils/validation_utils.dart';
import 'package:business_terminal/presentation/registration/form_validation_rules/user_info_form_group.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormSettingsConfirmPassword {
  ValidatorFunction get _validPassword => PasswordValidator().validate;

  static const kMaxLength = 256;
  static const kMinLengthPassword = 9;

  ///Field names
  final kFieldNewPassword = 'new_password';
  final kFieldNewPasswordConfirmation = 'new_password_confirmation';

  ///Validation rule keywords
  static const _kPasswordValidationRuleMustMatch = 'mustMatch';
  static const _kPasswordValidationRuleValidPass = 'passwordValid';

  final validationMessagePassword = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength',
    ValidationMessage.minLength: 'Minimal length is $kMinLengthPassword',
    _kPasswordValidationRuleMustMatch: 'Passwords should be the same',
    _kPasswordValidationRuleValidPass: 'Password should be valid'
  };

  FormGroup buildForm() => FormGroup(
        {
          kFieldNewPassword: FormControl<String>(
            validators: [
              Validators.required,
              Validators.maxLength(kMaxLength),
              _validPassword
            ],
          ),
          kFieldNewPasswordConfirmation: FormControl<String>(
            validators: [
              Validators.required,
              Validators.maxLength(kMaxLength),
              _validPassword
            ],
          ),
        },
        validators: [
          ValidationUtils.mustMatch(
            validationRuleKey: _kPasswordValidationRuleMustMatch,
            controlName: kFieldNewPassword,
            matchingControlName: kFieldNewPasswordConfirmation,
          )
        ],
      );
}
