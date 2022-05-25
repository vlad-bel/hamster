import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddOpeningHoursFormSettings {
  static const kMinLengthField = 5;
  static const kMaxLengthField = 5;

  static const opensField = 'opens_field';
  static const closedField = 'closes_field';

  static const timeFormat = r'[0-2][0-9]:[0-5][\d]';

  final validationMessage = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.pattern: 'Wrong time format. Time should be in 24h format.',
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
    ValidationMessage.minLength: 'Minimal length is $kMinLengthField',
  };

  FormGroup buildForm() {
    return FormGroup(
      {
        opensField: FormControl<String>(
          validators: [
            Validators.required,
            Validators.pattern(timeFormat),
            Validators.minLength(kMinLengthField),
            Validators.maxLength(kMaxLengthField),
          ],
        ),
        closedField: FormControl<String>(
          validators: [
            Validators.required,
            Validators.pattern(timeFormat),
            Validators.minLength(kMinLengthField),
            Validators.maxLength(kMaxLengthField),
          ],
        ),
      },
    );
  }
}
