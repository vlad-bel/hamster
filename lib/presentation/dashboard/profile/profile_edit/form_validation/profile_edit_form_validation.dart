import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@singleton
class ProfileEditFormSettings {
  static const kAccountOwner = 'account_owner';
  static const kCommercialRegisterNumber = 'commercial_register_number';
  static const kCompanyName = 'company_name';
  static const kIban = 'iban';
  static const kStreetHouseNumber = 'street_house_number';
  static const kTaxNumber = 'tax_number';
  static const kVatId = 'vat_id';
  static const kZipCodeAndLocation = 'zip_code_and_location';

  final controls = {
    kCompanyName: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kStreetHouseNumber: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kZipCodeAndLocation: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    kCommercialRegisterNumber: FormControl<String>(
      validators: [
        Validators.maxLength(64),
        Validators.minLength(2),
      ],
    ),
    kTaxNumber: FormControl<String>(
      validators: [
        Validators.required,
        Validators.maxLength(64),
        Validators.minLength(2),
      ],
    ),
    kVatId: FormControl<String>(
      validators: [],
    ),
    kAccountOwner: FormControl<String>(
      validators: [],
    ),
    kIban: FormControl<String>(
      validators: [],
    ),
  };

  final validationMessages = {
    ValidationMessage.required: tr('required_field'),
    ValidationMessage.minLength: tr('min_length_field'),
    ValidationMessage.maxLength: tr('max_length_field'),
  };

  FormGroup buildForm() {
    return FormGroup(controls);
  }
}