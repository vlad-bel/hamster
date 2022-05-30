import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:iban/iban.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPaymentFormSettings {
  static const kAcceptCheckBox = 'accept_terms';
  static const kAccountOwnerField = 'account_owner';
  static const kIbanField = 'iban';
  static const kMaxLengthAccountOwner = 256;

  /// Actual value is 34 aligned by spaces
  static const kMaxLengthIban = 42;

  static const kMinLengthAccountOwner = 2;

  /// Actual value is 10 aligned by spaces
  static const kMinLengthIban = 12;

  static final validationMessageAccountOwner = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
    ValidationMessage.minLength: 'Minimal length is $kMinLengthAccountOwner',
  };

  static final validationMessageIban = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: AppLocale.current.max_length_reached
        .replaceFirst(r'$0', '${kMaxLengthIban - 8}'),
    ValidationMessage.minLength: 'Minimal length is ${kMinLengthIban - 2}',
    ValidationMessage.pattern: AppLocale.current.iban_format_error
  };

  final controls = {
    kAccountOwnerField: FormControl<String>(
      // Disable validators when in read only mode
      validators: [
        Validators.required,
        Validators.minLength(kMinLengthAccountOwner),
        Validators.maxLength(kMaxLengthAccountOwner),
      ],
    ),
    kIbanField: FormControl<String>(
      // Disable validators when in read only mode
      validators: [
        Validators.required,
        Validators.minLength(kMinLengthIban),
        Validators.maxLength(kMaxLengthIban),
        _ibanValidator,
      ],
    ),
    kAcceptCheckBox: FormControl<bool>(
      validators: [
        Validators.requiredTrue,
      ],
    ),
  };

  FormGroup buildForm({
    required String iban,
    required String accountOnwer,
  }) {
    setControlValue(kIbanField, iban);
    setControlValue(kAccountOwnerField, accountOnwer);
    return FormGroup(
      controls,
    );
  }

  void setControlValue(String key, String? value) {
    if (value.toString() != null.toString()) {
      controls[key]!.value = value;
    }
  }

  static Map<String, bool>? _ibanValidator(AbstractControl<dynamic> control) {
    return control.isNotNull &&
            control.value is String &&
            isValid(control.value as String)
        ? null
        : {'pattern': true};
  }
}
