import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:business_terminal/config/validation_constants.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditPersonalDataFormGroup {
  static const kNameSurnameMin = 2;
  static const kNameMaxLength = 70;
  static const kPasswordValidationRuleMustMatch = 'mustMatch';
  static const kPasswordValidationRuleValidPass = 'passwordValid';

  // Form fields:
  static const kFieldName = 'name';
  static const kFieldSurname = 'surname';
  static const kFieldEmail = 'email';
  static const kFieldPhone = 'phone';

  static Map<String, String> validationMessageNameSurname(S localization) => {
        ValidationMessage.required: localization.shouldNotBeEmpty,
        ValidationMessage.minLength: localization.minLength(kNameMaxLength),
        ValidationMessage.maxLength: localization.maxLength(kNameMaxLength),
        ValidationMessage.pattern:
            localization.shouldNotContainSpecialCharacters
      };

  FormGroup buildForm() {
    final nameSurnameValidators = [
      Validators.required,
      Validators.minLength(kNameSurnameMin),
      Validators.maxLength(kNameMaxLength),
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
        kFieldEmail: FormControl<String>(),
        kFieldPhone: FormControl<String>()
      },
    );
  }
}
