import 'package:reactive_forms/reactive_forms.dart';

class ValidationUtils {
  static ValidatorFunction mustMatch(
      {required String validationRuleKey,
      required String controlName,
      required String matchingControlName}) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;

      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);

      if (formControl.value != matchingFormControl.value) {
        final errors = {validationRuleKey: true};
        matchingFormControl
          ..setErrors(errors)
          ..markAsTouched();
        // force messages to show up as soon as possible
      } else {
        matchingFormControl.removeError(validationRuleKey);
      }

      return null;
    };
  }
}

extension StringValidators on String {
  bool get containsUppercase => contains(RegExp('[A-Z]'));

  bool get containsLowercase => contains(RegExp('[a-z]'));

  bool get containsNumbers => contains(RegExp('[0-9]'));

  bool get containsSpecialCharacters =>
      contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}
