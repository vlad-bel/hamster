import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
    ValidationMessage.maxLength: tr(LocaleKeys.max_length_reached),
    ValidationMessage.minLength: 'Minimal length is $kMinLengthAccountOwner',
  };

  final validationMessageIban = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: tr(LocaleKeys.max_length_reached)
        .replaceFirst(r'$0', '${kMaxLengthIban - 8}'),
    ValidationMessage.minLength: 'Minimal length is ${kMinLengthIban - 2}',
    ValidationMessage.pattern: tr(LocaleKeys.iban_format_error),
  };

  static const accountOwnerField = 'accountOwner';
  static const ibanField = 'iban';

  FormGroup buildForm(String? accountOwner, String? iban) {
    return FormGroup(
      {
        accountOwnerField: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(kMinLengthAccountOwner),
            Validators.maxLength(kMaxLengthAccountOwner),
          ],
          value: accountOwner,
        ),
        ibanField: FormControl<String>(
          touched: true,
          validators: [
            Validators.required,
            _ibanValidator,
            Validators.minLength(kMinLengthIban),
            Validators.maxLength(kMaxLengthIban),
          ],
          value: iban,
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
