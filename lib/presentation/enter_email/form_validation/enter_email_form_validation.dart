import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class EnterEmailFormSettings {
  static const emailField = 'email';
  static const kNameSurnameMin = 2;
  static const nameEmailMaxLength = 70;

  static final validationMessageEmail = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.email: 'Should be a valid email',
    ValidationMessage.maxLength: 'Maximal length is $nameEmailMaxLength',
  };

  final controls = {
    emailField: FormControl<String>(
      // Disable validators when in read only mode
      validators: [
        Validators.required,
        Validators.email,
        Validators.maxLength(nameEmailMaxLength),
      ],
    ),
  };

  FormGroup buildForm({
    String? email,
  }) {
    setControlValue(emailField, email ?? '');
    return FormGroup(
      controls,
    );
  }

  void setControlValue(String key, String? value) {
    if (value.toString() != null.toString()) {
      controls[key]!.value = value;
    }
  }
}
