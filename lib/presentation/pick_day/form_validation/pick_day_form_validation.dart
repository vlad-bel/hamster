import 'package:reactive_forms/reactive_forms.dart';

class PickDayFormSettings {
  static const kMinLengthField = 2;
  static const kMaxLengthField = 256;
  static const kMaxPosCount = 50;

  static const mondayField = 'monday';
  static const tuesdayField = 'tuesday';
  static const wednesdayField = 'wednesday';
  static const thursdayField = 'thursday';
  static const fridayField = 'friday';
  static const saturdayField = 'saturday';
  static const sundayField = 'sunday';

  static const selectAllField = 'select_all';

  final weekControls = {
    mondayField: FormControl<bool>(value: false),
    tuesdayField: FormControl<bool>(value: false),
    wednesdayField: FormControl<bool>(value: false),
    thursdayField: FormControl<bool>(value: false),
    fridayField: FormControl<bool>(value: false),
    saturdayField: FormControl<bool>(value: false),
    sundayField: FormControl<bool>(value: false),
  };

  final otherControls = {
    selectAllField: FormControl<bool>(value: false),
  };

  FormGroup buildForm() {
    return FormGroup(
      weekControls..addAll(otherControls),
      validators: [emptyAddressee],
    );
  }

  Map<String, dynamic>? emptyAddressee(AbstractControl control) {
    final checkboxValues =
        (control as FormGroup).value.values.map((e) => e as bool);
    return checkboxValues.any((isSelected) => isSelected)
        ? null
        : {'checkedBox': true};
  }
}
