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
}
