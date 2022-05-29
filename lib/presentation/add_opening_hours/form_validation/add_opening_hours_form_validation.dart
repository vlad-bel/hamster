import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddOpeningHoursFormSettings {
  static const _kMinLengthField = 5;

  static const opensField = 'opens_field';
  static const closesField = 'closes_field';

  static const _openCloseError = 'open_close_error';
  static const _rangesCollideError = 'range_collide_error';

  static const _timeFormat = r'[0-2][0-9]:[0-5][\d]';
  static const _timePattern = 'HH:mm';

  final openFields = <String>[];
  final closeFields = <String>[];

  final formGroup = FormGroup({});

  final validationMessage = {
    ValidationMessage.required: 'Should not be empty',
    ValidationMessage.minLength: 'Minimal length is $_kMinLengthField',
    ValidationMessage.pattern:
        'Wrong time format. Time should be in 24h format.',
    _openCloseError: 'Opening time should be before closing time',
    _rangesCollideError: 'Time ranges shouldn\'t overlap',
  };

  final fieldValidators = [
    Validators.required,
    Validators.pattern(_timeFormat),
    Validators.minLength(_kMinLengthField),
  ];

  ValidatorFunction openCloseValidator(
    String openControl,
    String closeControl,
  ) {
    return (AbstractControl<dynamic> control) {
      final formGroup = control as FormGroup;

      final openFormControl = formGroup.control(openControl);

      final openTimeString = formGroup.control(openControl).value as String;
      final closeTimeString = formGroup.control(closeControl).value as String;

      if (openTimeString.length < 5 || closeTimeString.length < 5) return null;

      final format = DateFormat(_timePattern);
      final openTime = format.parse(openTimeString);
      final closeTime = format.parse(closeTimeString);

      final isAfter = openTime.isAfter(closeTime);

      if (isAfter) {
        openFormControl
          ..setErrors({_openCloseError: true})
          ..markAsTouched();
      } else {
        formGroup.removeError(_openCloseError);
        openFormControl
          ..removeError(_openCloseError)
          ..markAsTouched();
      }

      return null;
    };
  }

  ValidatorFunction collisionValidator(
    String openControl0,
    String closeControl0,
    String openControl1,
    String closeControl1,
  ) {
    return (AbstractControl<dynamic> control) {
      final formGroup = control as FormGroup;

      final openTimeString0 = formGroup.control(openControl0).value as String;
      final closeTimeString0 = formGroup.control(closeControl0).value as String;
      final openTimeString1 = formGroup.control(openControl1).value as String;
      final closeTimeString1 = formGroup.control(closeControl1).value as String;

      if (openTimeString0.length < 5 ||
          closeTimeString0.length < 5 ||
          openTimeString1.length < 5 ||
          closeTimeString1.length < 5) return null;

      final openFormControl1 = formGroup.control(openControl1);

      final format = DateFormat(_timePattern);
      final openTime0 = format.parse(openTimeString0);
      final closeTime0 = format.parse(closeTimeString0);
      final openTime1 = format.parse(openTimeString1);
      final closeTime1 = format.parse(closeTimeString1);

      final open0Inside = openTime0.isBetween(openTime1, closeTime1);
      final close0Inside = closeTime0.isBetween(openTime1, closeTime1);
      final open1Inside = openTime1.isBetween(openTime0, closeTime0);
      final close1Inside = closeTime1.isBetween(openTime0, closeTime0);

      if (open0Inside || close0Inside || open1Inside || close1Inside) {
        openFormControl1
          ..setErrors({_rangesCollideError: true})
          ..markAsTouched();
      } else {
        formGroup.removeError(_rangesCollideError);
        openFormControl1
          ..removeError(_rangesCollideError)
          ..markAsTouched();
      }

      return null;
    };
  }
}

extension _BetweenEx on DateTime {
  bool isBetween(DateTime left, DateTime right) {
    return isAfter(left) && isBefore(right);
  }
}
