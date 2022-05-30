import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/branch_profile/widget/drop_down_select_entrances_count.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPosFormSettings {
  static const kMinLengthField = 2;
  static const kMaxLengthField = 256;
  static const kMaxPosCount = 50;

  static const cashRegisterField = 'cashRegister';
  static const modelField = 'model';
  static const posNumberField = 'posNumber';

  final validationMessageCashRegister = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
    ValidationMessage.minLength: 'Minimal length is $kMinLengthField',
  };

  final validationMessageModel = {
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
    ValidationMessage.minLength: 'Minimal length is $kMinLengthField',
  };

  FormGroup buildForm() {
    return FormGroup(
      {
        cashRegisterField: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(kMinLengthField),
            Validators.maxLength(kMaxLengthField),
          ],
        ),
        modelField: FormControl<String>(
          validators: [
            Validators.minLength(kMinLengthField),
            Validators.maxLength(kMaxLengthField),
          ],
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
