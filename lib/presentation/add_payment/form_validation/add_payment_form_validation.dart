import 'package:reactive_forms/reactive_forms.dart';

class AddPaymentFormSettings {
  static const kMaxLength = 256;
  static const kMinLengthPassword = 9;

  final validationMessageAccountOwner = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength'
  };

  final validationMessageIban = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: 'Maximal length is $kMaxLength',
    ValidationMessage.minLength: 'Minimal length is $kMinLengthPassword'
  };

  static const accountOwnerField = 'accountOwner';
  static const ibanField = 'iban';

  FormGroup buildForm(String? accountOwner, String? iban) {
    return FormGroup(
      {
        accountOwnerField: FormControl<String>(
          validators: [
            Validators.minLength(2),
            Validators.maxLength(kMaxLength),
            Validators.required,
          ],
          value: accountOwner,
        ),
        ibanField: FormControl<String>(
          validators: [
            Validators.minLength(10),
            Validators.maxLength(34),
            Validators.required,
          ],
          value: iban,
        ),
      },
    );
  }
}
