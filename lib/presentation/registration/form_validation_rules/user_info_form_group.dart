import 'package:business_terminal/presentation/registration/view/password_checkboxes_view.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormSettingsRegistrationUserInfo {
  static const kNameSurnameMin = 2;
  static const kMaxLength = 256;
  static const kPasswordValidationRuleMustMatch = 'mustMatch';

  // Form fields:
  final kFieldName = 'name';
  final kFieldSurname = 'surname';
  final kFieldEmail = 'email';
  final kFieldPassword = 'password';
  final kFieldPasswordConfirmation = 'passwordConfirmation';

  final Map<String, String> validationMessageNameSurname = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.minLength: 'Minimal length is $kNameSurnameMin',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength'
  };

  final validationMessageEmail = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.email: 'Should be a valid email',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength'
  };

  final validationMessagePassword = {
    ValidationMessage.required: 'Should not be empty',
    kPasswordValidationRuleMustMatch: 'Passwords should be the same',
  };

  FormGroup buildForm() {
    return FormGroup(
      {
        kFieldName: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(kNameSurnameMin),
            Validators.maxLength(kMaxLength)
          ],
        ),
        kFieldSurname: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(kNameSurnameMin),
            Validators.maxLength(kMaxLength)
          ],
        ),
        kFieldEmail: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
            Validators.maxLength(kMaxLength)
          ],
        ),
        kFieldPassword: FormControl<String>(
          validators: [Validators.required],
        ),
        kFieldPasswordConfirmation: FormControl<String>(
          validators: [Validators.required],
        )
      },
      validators: [_mustMatch(kFieldPassword, kFieldPasswordConfirmation)],
    );
  }

  // Both fields in form must be the same
  ValidatorFunction _mustMatch(String controlName, String matchingControlName) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;

      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);

      if (formControl.value != matchingFormControl.value) {
        final errors = {kPasswordValidationRuleMustMatch: true};
        matchingFormControl
          ..setErrors(errors)
          ..markAsTouched();
        // force messages to show up as soon as possible
      } else {
        matchingFormControl.removeError(kPasswordValidationRuleMustMatch);
      }

      return null;
    };
  }

  bool isPasswordValid(String password) {
    final has10Characters = password.length >= minimalPasswordLength;
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
