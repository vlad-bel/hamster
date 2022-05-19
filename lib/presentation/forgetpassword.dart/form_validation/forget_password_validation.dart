import 'package:reactive_forms/reactive_forms.dart';

class ForgetPasswordFormSettings {
  final kfieldEmail = 'email';

  static const kMaxLength = 256;

  final validationMessageEmail = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.email: 'Should be a valid email',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength'
  };

  FormGroup buildForm() {
    return FormGroup({
      kfieldEmail: FormControl<String>(validators: [
        Validators.required,
        Validators.email,
        Validators.maxLength(kMaxLength)
      ]),
    });
  }
}
