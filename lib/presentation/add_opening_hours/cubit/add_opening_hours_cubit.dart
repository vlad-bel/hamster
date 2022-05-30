import 'package:bloc/bloc.dart';
import 'package:business_terminal/presentation/add_opening_hours/form_validation/add_opening_hours_form_validation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'add_opening_hours_cubit.freezed.dart';

@injectable
class AddOpeningHoursCubit extends Cubit<AddOpeningHoursState> {
  AddOpeningHoursCubit()
      : super(
          AddOpeningHoursState.initial(
            hourRanges: <int>[],
            error: '',
          ),
        );

  final formSettings = AddOpeningHoursFormSettings();

  bool get showAddButton =>
      (state as InitialAddOpeningHours).hourRanges.length <= 1;

  void addRange() {
    state.whenOrNull(
      initial: (hourRanges, error) {
        final endingNumber = hourRanges.contains(0) ? 1 : 0;
        final openFieldName =
            '${AddOpeningHoursFormSettings.opensField}$endingNumber';
        final closeFieldName =
            '${AddOpeningHoursFormSettings.closesField}$endingNumber';

        formSettings.openFields.add(openFieldName);
        formSettings.closeFields.add(closeFieldName);

        formSettings.formGroup.addAll({
          openFieldName: FormControl<String>(
            validators: formSettings.fieldValidators,
            value: '',
          ),
          closeFieldName: FormControl<String>(
            validators: formSettings.fieldValidators,
            value: '',
          ),
        });

        _updateValidators();

        emit(
          AddOpeningHoursState.initial(
            hourRanges: [...hourRanges, endingNumber],
            error: error,
          ),
        );
      },
    );
  }

  void deleteRange(int item) {
    state.whenOrNull(
      initial: (hourRange, error) {
        final openFieldName = '${AddOpeningHoursFormSettings.opensField}$item';
        final closeFieldName =
            '${AddOpeningHoursFormSettings.closesField}$item';

        formSettings.openFields.remove(openFieldName);
        formSettings.closeFields.remove(closeFieldName);

        // TODO: Bug in library - actually deletes controls but throws an error
        // DO NOT REMOVE until library is fixed (https://github.com/joanpablo/reactive_forms/issues/292)
        try {
          formSettings.formGroup.removeControl(openFieldName);
        } catch (_) {}
        try {
          formSettings.formGroup.removeControl(closeFieldName);
        } catch (_) {}

        _updateValidators();

        emit(
          AddOpeningHoursState.initial(
            hourRanges: [...hourRange]..remove(item),
            error: error,
          ),
        );
      },
    );
  }

  void validateForms() {
    state.whenOrNull(
      initial: (hourRanges, error) {
        final errors = formSettings.formGroup.errors;

        if (errors.isEmpty) {
          emit(
            AddOpeningHoursState.initial(
              hourRanges: hourRanges,
              error: '',
            ),
          );
          return;
        }

        final foundError = (errors.values.first as Map).keys.first;

        emit(
          AddOpeningHoursState.initial(
            hourRanges: hourRanges,
            error: formSettings.validationMessage[foundError] ?? '',
          ),
        );
      },
    );
  }

  void _updateValidators() {
    formSettings.formGroup.setValidators([
      for (var i = 0; i < formSettings.openFields.length; i++)
        formSettings.openCloseValidator(
          formSettings.openFields[i],
          formSettings.closeFields[i],
        ),
      if (formSettings.openFields.length > 1)
        formSettings.collisionValidator(
          formSettings.openFields.first,
          formSettings.closeFields.first,
          formSettings.openFields.last,
          formSettings.closeFields.last,
        ),
    ]);
  }
}

@freezed
class AddOpeningHoursState with _$AddOpeningHoursState {
  const factory AddOpeningHoursState.initial({
    required List<int> hourRanges,
    required String error,
  }) = InitialAddOpeningHours;
}
