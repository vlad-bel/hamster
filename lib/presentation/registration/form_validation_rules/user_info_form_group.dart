import 'package:business_terminal/presentation/registration/view/password_checkboxes_view.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormGroupRegistrationUserInfo {
  FormGroup buildForm() => FormGroup(
        {
          'name': FormControl<String>(
            validators: [Validators.required, Validators.minLength(2)],
          ),
          'surname': FormControl<String>(
            validators: [Validators.required, Validators.minLength(2)],
          ),
          'email': FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
          'password': FormControl<String>(
            validators: [Validators.required, Validators.minLength(10)],
          ),
          'passwordConfirmation': FormControl<String>()
        },
        validators: [_mustMatch('password', 'passwordConfirmation')],
      );

  // Both fields in form must be the same
  ValidatorFunction _mustMatch(String controlName, String matchingControlName) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;

      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);

      if (formControl.value != matchingFormControl.value) {
        final errors = {'mustMatch': true};
        matchingFormControl
          ..setErrors(errors)
          ..markAsTouched();
        // force messages to show up as soon as possible
      } else {
        matchingFormControl.removeError('mustMatch');
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
