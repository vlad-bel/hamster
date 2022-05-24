import 'package:reactive_forms/reactive_forms.dart';

class DashboardFormValidation {
  static const acceptCheckBox = 'acceptTerms';

  FormGroup buildForm() {
    return FormGroup(
      {
        acceptCheckBox: FormControl<bool>(
          validators: [
            Validators.requiredTrue,
          ],
        ),
      },
    );
  }
}
