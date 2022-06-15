import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:iban/iban.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProfileEditFormSettings {
  static const addressField = 'address';
  static const kAccountOwner = 'account_owner';
  static const kCityField = 'city';
  static const kCommercialRegisterNumber = 'commercial_register_number';
  static const kCompanyName = 'company_name';
  static const kIban = 'iban';
  static const kMaxLengthAccountOwner = 256;

  /// Actual value is 34 aligned by spaces
  static const kMaxLengthIban = 42;

  static const kMinLengthAccountOwner = 2;

  /// Actual value is 10 aligned by spaces
  static const kMinLengthIban = 12;

  static const kPostcodeField = 'postcode';
  static const kStreetField = 'street';
  static const kStreetNumberField = 'houseNum';
  static const kTaxNumber = 'tax_number';
  static const kVatId = 'vat_id';

  final controls = {
    kCompanyName: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kStreetField: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kStreetNumberField: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kPostcodeField: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kCityField: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kCommercialRegisterNumber: FormControl<String>(
      validators: [
        Validators.pattern(r'^.{2,64}$'),
      ],
    ),
    kTaxNumber: FormControl<String>(
      validators: [
        Validators.pattern(r'^.{2,64}$'),
      ],
    ),
    kVatId: FormControl<String>(
      validators: [
        Validators.pattern(r'^.{2,64}$'),
      ],
    ),
    kAccountOwner: FormControl<String>(
      validators: [
        Validators.minLength(kMinLengthAccountOwner),
        Validators.maxLength(kMaxLengthAccountOwner),
      ],
    ),
    kIban: FormControl<String>(
      // Disable validators when in read only mode
      validators: [
        Validators.minLength(kMinLengthIban),
        Validators.maxLength(kMaxLengthIban),
        _ibanValidator,
      ],
    ),
  };

  final validationMessages = {
    ValidationMessage.required: AppLocale.current.required_field,
    ValidationMessage.minLength: AppLocale.current.min_length_field,
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
  };

  FormGroup buildForm() {
    return FormGroup(controls);
  }

  static Map<String, bool>? _ibanValidator(AbstractControl<dynamic> control) {
    return control.isNotNull &&
            control.value is String &&
            isValid(control.value as String)
        ? null
        : {'pattern': true};
  }
}
