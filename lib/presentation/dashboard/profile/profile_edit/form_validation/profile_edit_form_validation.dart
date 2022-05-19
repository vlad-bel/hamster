import 'package:easy_localization/easy_localization.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileEditFormSettings {
  final kCompanyName = 'company_name';
  final kStreetHouseNumber = 'street_house_number';
  final kZipCodeAndLocation = 'zip_code_and_location';
  final kCommercialRegisterNumber = 'commercial_register_number';
  final kTaxNumber = 'tax_number';
  final kVatId = 'vat_id';
  final kAccountOwner = 'account_owner';
  final kIban = 'iban';

  final validationMessages = {
    ValidationMessage.required: tr('required_field'),
    ValidationMessage.minLength: tr('min_length_field'),
    ValidationMessage.maxLength: tr('max_length_field'),
  };

  FormGroup buildForm() {
    return FormGroup({
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
        validators: [
          Validators.required,
        ],
      ),
      kAccountOwner: FormControl<String>(
        validators: [],
      ),
      kIban: FormControl<String>(
        validators: [],
      ),
    });
  }
}
