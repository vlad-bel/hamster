import 'package:business_terminal/app/utils/validation_utils.dart';
import 'package:business_terminal/config/validation_constants.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditPersonalDataFormGroup {
  static const kNameSurnameMin = 2;
  static const nameMaxLength = 70;
  static const kPasswordValidationRuleMustMatch = 'mustMatch';
  static const kPasswordValidationRuleValidPass = 'passwordValid';
  final nameSurnameRegexp = RegExp(r"^[a-z ,.\'-]+$", caseSensitive: false);

  // Form fields:
  final kFieldName = 'name';
  final kFieldSurname = 'surname';

  final Map<String, String> validationMessageNameSurname = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.minLength: 'Minimal length is $kNameSurnameMin',
    ValidationMessage.maxLength: 'Maximal length is $nameMaxLength',
    ValidationMessage.pattern: 'Should not contain special characters'
  };

  FormGroup buildForm() {
    final nameSurnameValidators = [
      Validators.required,
      Validators.minLength(kNameSurnameMin),
      Validators.maxLength(nameMaxLength),
      Validators.pattern(nameSurnameRegexp)
    ];

    return FormGroup(
      {
        kFieldName: FormControl<String>(
          validators: nameSurnameValidators,
        ),
        kFieldSurname: FormControl<String>(
          validators: nameSurnameValidators,
        ),
      },
    );
  }
}
