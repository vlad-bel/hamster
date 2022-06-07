import 'package:business_terminal/app/utils/validation_utils.dart';
import 'package:business_terminal/config/validation_constants.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormSettingsRegistrationUserInfo {
  static const kNameSurnameMin = 2;
  static const nameEmailMaxLength = 70;
  static const kMaxLength = 256;
  static const kPasswordValidationRuleMustMatch = 'mustMatch';
  static const kPasswordValidationRuleValidPass = 'passwordValid';

  ValidatorFunction get validPassword => PasswordValidator().validate;

  // Form fields:
  final kFieldName = 'name';
  final kFieldSurname = 'surname';
  final kFieldEmail = 'email';
  final kFieldPassword = 'password';
  final kFieldPasswordConfirmation = 'passwordConfirmation';

  final Map<String, String> validationMessageNameSurname = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.minLength: 'Minimal length is $kNameSurnameMin',
    ValidationMessage.maxLength: 'Maximal length is $nameEmailMaxLength',
    ValidationMessage.pattern: 'Should not contain special characters'
  };

  final validationMessageEmail = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.email: 'Should be a valid email',
    ValidationMessage.maxLength: 'Maximal length is $nameEmailMaxLength',
    kPasswordValidationRuleValidPass: 'Password should be valid'
  };

  final validationMessagePassword = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength',
    kPasswordValidationRuleMustMatch: 'Passwords should be the same',
    kPasswordValidationRuleValidPass: 'Password should be valid'
  };

  FormGroup buildForm() {
    final nameSurnameValidators = [
      Validators.required,
      Validators.minLength(kNameSurnameMin),
      Validators.maxLength(nameEmailMaxLength),
      Validators.pattern(ValidationConstants.nameSurnameRegexp)
    ];

    return FormGroup(
      {
        kFieldName: FormControl<String>(
          validators: nameSurnameValidators,
        ),
        kFieldSurname: FormControl<String>(
          validators: nameSurnameValidators,
        ),
        kFieldEmail: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
            Validators.maxLength(nameEmailMaxLength)
          ],
        ),
        kFieldPassword: FormControl<String>(
          validators: [
            Validators.required,
            Validators.maxLength(kMaxLength),
            validPassword
          ],
        ),
        kFieldPasswordConfirmation: FormControl<String>(
          validators: [
            Validators.required,
            Validators.maxLength(kMaxLength),
            validPassword
          ],
        )
      },
      validators: [
        ValidationUtils.mustMatch(
          validationRuleKey: kPasswordValidationRuleMustMatch,
          controlName: kFieldPassword,
          matchingControlName: kFieldPasswordConfirmation,
        ),
      ],
    );
  }
}

// Checks all 5 rules for password (length, characters, numbers, etc)
class PasswordValidator extends Validator<dynamic> {
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{
      FormSettingsRegistrationUserInfo.kPasswordValidationRuleValidPass: true
    };

    final value = control.value as String?;
    if (value == null) {
      return error;
    } else if (!isPasswordValid(value)) {
      return error;
    }

    return null;
  }

  bool isPasswordValid(String password) {
    final has10Characters =
        password.length >= ValidationConstants.kMinimalPasswordLength;
    final has1LowerCaseLetter = password.containsLowercase;
    final has1UpperCaseLetter = password.containsUppercase;
    final has1SpecialCharacter = password.containsSpecialCharacters;
    final has1Number = password.containsNumbers;

    return has10Characters &
        has1LowerCaseLetter &
        has1UpperCaseLetter &
        has1SpecialCharacter &
        has1Number;
  }
}
