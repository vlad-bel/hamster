import 'package:business_terminal/presentation/branch_profile/widget/drop_down_select_entrances_count.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BranchProfileFormValidation {
  static const kMaxLength = 256;
  static const kMinLength = 2;

  final kFieldBranchName = 'branchName';
  final kFieldStreet = 'street';
  final kFieldCity = 'city';
  final kFieldWebsite = 'website';
  final kFieldPhone = 'phone';
  final kFieldEntrancesCount = 'entrancesCount';

  final validationMessagesGeneric = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.maxLength: 'Maximal length is exceeded',
    ValidationMessage.minLength: 'Minimal length is $kMinLength'
  };

  FormGroup buildForm() {
    return FormGroup({
      kFieldBranchName: FormControl<String>(
        validators: [
          Validators.minLength(kMinLength),
          Validators.maxLength(32),
          Validators.required,
        ],
      ),
      kFieldStreet: FormControl<String>(
        validators: [
          Validators.minLength(kMinLength),
          Validators.maxLength(120),
          Validators.required,
        ],
      ),
      kFieldCity: FormControl<String>(
        validators: [
          Validators.minLength(kMinLength),
          Validators.maxLength(128),
          Validators.required,
        ],
      ),
      kFieldWebsite: FormControl<String>(
        validators: [
          Validators.minLength(kMinLength),
          Validators.maxLength(200),
          Validators.required,
          // TODO: add website validation after demo
        ],
      ),
      kFieldPhone: FormControl<String>(
        validators: [
          Validators.minLength(kMinLength),
          Validators.maxLength(200),
          Validators.required,
          // TODO: add number validation after demo
        ],
      ),
      kFieldEntrancesCount: FormControl<PlaceEntranceCount>(
        validators: [
          Validators.required,
        ],
      )
    });
  }
}
