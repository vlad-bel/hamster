import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:iban/iban.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPaymentFormSettings {
  static const kMaxLengthAccountOwner = 256;
  static const kMinLengthAccountOwner = 2;

  /// Actual value is 34 aligned by spaces
  static const kMaxLengthIban = 42;

  /// Actual value is 10 aligned by spaces
  static const kMinLengthIban = 12;

  final validationMessageAccountOwner = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
    ValidationMessage.minLength: 'Minimal length is $kMinLengthAccountOwner',
  };

  final validationMessageIban = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: AppLocale.current.max_length_reached
        .replaceFirst(r'$0', '${kMaxLengthIban - 8}'),
    ValidationMessage.minLength: 'Minimal length is ${kMinLengthIban - 2}',
    ValidationMessage.pattern: AppLocale.current.iban_format_error
  };

  static const accountOwnerField = 'accountOwner';
  static const ibanField = 'iban';
  static const acceptCheckBox = 'acceptTerms';

  FormGroup buildForm(
    String? accountOwner,
    String? iban, {
    bool enableValidators = true,
  }) {
    return FormGroup(
      {
        accountOwnerField: FormControl<String>(
          // Disable validators when in read only mode
          validators: enableValidators
              ? [
                  Validators.required,
                  Validators.minLength(kMinLengthAccountOwner),
                  Validators.maxLength(kMaxLengthAccountOwner),
                ]
              : [],
          value: accountOwner,
        ),
        ibanField: FormControl<String>(
          // Disable validators when in read only mode
          validators: enableValidators
              ? [
                  Validators.required,
                  Validators.minLength(kMinLengthIban),
                  Validators.maxLength(kMaxLengthIban),
                  _ibanValidator,
                ]
              : [],
          value: iban,
        ),
        acceptCheckBox: FormControl<bool>(
          validators: [
            Validators.requiredTrue,
          ],
        ),
      },
    );
  }

  Map<String, bool>? _ibanValidator(AbstractControl<dynamic> control) {
    return control.isNotNull &&
            control.value is String &&
            isValid(control.value as String)
        ? null
        : {'pattern': true};
  }
}
