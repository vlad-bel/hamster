import 'package:reactive_forms/reactive_forms.dart';

class LoginFormSettings {
  static const kMaxLength = 256;
  static const kMinLengthPassword = 10;

  final kFieldEmail = 'email';
  final kFieldPassword = 'password';

  final validationMessageEmail = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.email: 'Should be a valid email',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength'
  };

  final validationMessagePassword = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength',
    ValidationMessage.minLength: 'Minimal length is $kMinLengthPassword'
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
          Validators.minLength(10)
        ],
      ),
    });
  }
}
