import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:business_terminal/presentation/branch_profile/widget/drop_down_select_entrances_count.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPosFormSettings {
  static const kMinLengthField = 2;
  static const kMaxLengthField = 256;

  static const cashRegisterField = 'cashRegister';
  static const modelField = 'model';
  static const posNumberField = 'posNumber';

  final validationMessageCashRegister = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: tr(LocaleKeys.max_length_reached),
    ValidationMessage.minLength: 'Minimal length is $kMinLengthField',
  };

  final validationMessageModel = {
    ValidationMessage.maxLength: tr(LocaleKeys.max_length_reached),
    ValidationMessage.minLength: 'Minimal length is $kMinLengthField',
  };

  FormGroup buildForm(String? accountOwner, String? iban) {
    return FormGroup(
      {
        cashRegisterField: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(kMinLengthField),
            Validators.maxLength(kMaxLengthField),
          ],
          value: accountOwner,
        ),
        modelField: FormControl<String>(
          validators: [
            Validators.minLength(kMinLengthField),
            Validators.maxLength(kMaxLengthField),
          ],
          value: iban,
        ),
        posNumberField: FormControl<PlaceEntranceCount>(
          validators: [
            Validators.required,
          ],
        ),
      },
    );
  }
}
