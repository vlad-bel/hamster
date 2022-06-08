import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/branch_profile/widget/drop_down_select_entrances_count.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BranchProfileFormValidation {
  static const kMaxLength = 256;
  static const kMinLength = 2;

  final kFieldBranchName = 'branchName';
  final kFieldStreet = 'street';
  final kFieldCity = 'city';
  static const kFieldWebsite = 'website';
  static const kFieldPhone = 'phone';
  final kFieldEntrancesCount = 'entrancesCount';

  final validationMessagesGeneric = {
    ValidationMessage.required: AppLocale.current.required_field,
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
    ValidationMessage.minLength:
        '${AppLocale.current.min_length_field} $kMinLength',
    OptionalWebsiteValidator.website: AppLocale.current.min_length_field,
  };

  final phoneNumValidationMessage = {
    ///need make dynamic valigation
    ///that depended from countrycodes
    ValidationMessage.maxLength: AppLocale.current.max_length_reached,
    ValidationMessage.minLength: AppLocale.current.min_number(10),
    OptionalPhoneNumberValidator.phoneNumber:
        AppLocale.current.phone_validation,
  };

  final websiteValidator = OptionalWebsiteValidator().validate;
  final phoneNumberValidator = OptionalPhoneNumberValidator().validate;

  FormGroup buildForm() {
    return FormGroup({
      kFieldBranchName: FormControl<String>(
        validators: [
          Validators.minLength(kMinLength),
          Validators.maxLength(kMaxLength),
          Validators.required,
        ],
      ),
      kFieldStreet: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(kMinLength),
          Validators.maxLength(120),
        ],
      ),
      kFieldCity: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(kMinLength),
          Validators.maxLength(128),
        ],
      ),
      kFieldWebsite: FormControl<String>(
        validators: [
          websiteValidator,
          Validators.maxLength(256),
        ],
      ),
      kFieldPhone: FormControl<String>(
        validators: [
          ///TODO make dynamic lenght validator
          ///that depends from country  code
          phoneNumberValidator,
          // Validators.minLength(10),
          Validators.maxLength(128),
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

class OptionalWebsiteValidator extends Validator<dynamic> {
  static const website = 'website';

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value as String?;

    if (value?.isEmpty ?? true) {
      return null;
    }

    if (value!.length < 2) {
      return {
        ValidationMessage.minLength: 'min_length',
      };
    }

    final exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

    final valueIsWebsite = exp.hasMatch(value);

    if (!valueIsWebsite) {
      return {
        website: "web site must be like this 'website.com'",
      };
    }

    return null;
  }
}

class OptionalPhoneNumberValidator extends Validator<dynamic> {
  static const phoneNumber = 'phone_number';

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value as String?;

    if (value?.isEmpty ?? true) {
      return null;
    }

    if (value!.length < 10) {
      return {
        ValidationMessage.minLength: 'min_length',
      };
    }

    final exp = RegExp(
        r'^(?:\+\d{1,3}|0\d{1,3}|00\d{1,2})?(?:\s?\(\d+\))?(?:[-\/\s.]|\d)+$');

    final valueIsNumber = exp.hasMatch(value);

    if (!valueIsNumber) {
      return {
        phoneNumber:
            "Die angegebene Telefonnummer ist unbolting. Bitte versuchen Sie eine andere",
      };
    }

    return null;
  }
}
