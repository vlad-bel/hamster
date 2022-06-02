import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/temp/days_hours.dart';
import 'package:business_terminal/presentation/pick_day/form_validation/pick_day_form_validation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'pick_day_cubit.freezed.dart';

@injectable
class PickDayCubit extends Cubit<PickDayState> {
  PickDayCubit() : super(PickDayState.initial(hours: DaysHours.empty()));

  final formSettings = PickDayFormSettings();

  StreamSubscription? selectAllSubscription;

  StreamSubscription? checkboxesSubscription;

  /// Lock ticking when select all is pressed
  bool lockTicking = false;

  /// Skip next untick when need to change only select all state
  bool skipNextUntick = false;

  bool get needSetupSubs =>
      selectAllSubscription == null || checkboxesSubscription == null;

  @override
  Future<void> close() {
    selectAllSubscription?.cancel();
    checkboxesSubscription?.cancel();
    return super.close();
  }

  void setupSubs(FormGroup formGroup) {
    selectAllSubscription = (formGroup
            .control(PickDayFormSettings.selectAllField)
            .valueChanges as Stream<bool?>)
        .listen((event) {
      lockTicking = true;
      if (event!) {
        formGroup.forEachChild((checkbox) {
          checkbox.value = true;
        });
      } else {
        if (!skipNextUntick) {
          formGroup.forEachChild((checkbox) {
            checkbox.value = false;
          });
        }
        skipNextUntick = false;
      }
      Timer(Duration(milliseconds: 30), () {
        lockTicking = false;
      });
    });

    checkboxesSubscription = (formGroup.valueChanges.map((event) =>
            event!.map((key, value) => MapEntry(key, value as bool))))
        .listen((event) {
      if (lockTicking) return;

      var counterWeek = 0;
      event.forEach((key, value) {
        if (value) {
          if (PickDayFormSettings.selectAllField != key) {
            counterWeek++;
          }
        } else {
          skipNextUntick = true;
          formGroup.control(PickDayFormSettings.selectAllField).value = false;
        }
      });

      if (counterWeek > 6) {
        formGroup.control(PickDayFormSettings.selectAllField).value = true;
      }
    });
  }

  void setInitialHours(DaysHours? hours) {
    if (hours == null) return;

    emit(state.copyWith(hours: state.hours));
  }

  void setOpeningHours({
    required List<Map<String, String>> hours,
  }) {
    final time = _concatenateStrings(hours);

    for (final day in formSettings.formGroup.controls.keys) {
      if (day == PickDayFormSettings.selectAllField) {
        continue;
      }

      if (formSettings.formGroup.control(day).value as bool) {
        _setTime(day, time, state);
      }
    }

    state.whenOrNull(
      initial: (
        oldHours,
      ) {
        emit(state.copyWith(hours: state.hours));
      },
    );
    formSettings.formGroup.forEachChild((checkbox) {
      checkbox.value = false;
    });
  }

  void _setTime(String day, String value, PickDayState state) {
    switch (day) {
      case PickDayFormSettings.mondayField:
        state.hours.monday = value;
        break;
      case PickDayFormSettings.tuesdayField:
        state.hours.tuesday = value;
        break;
      case PickDayFormSettings.wednesdayField:
        state.hours.wednesday = value;
        break;
      case PickDayFormSettings.thursdayField:
        state.hours.thursday = value;
        break;
      case PickDayFormSettings.fridayField:
        state.hours.friday = value;
        break;
      case PickDayFormSettings.saturdayField:
        state.hours.saturday = value;
        break;
      case PickDayFormSettings.sundayField:
        state.hours.sunday = value;
        break;
    }
  }

  String _concatenateStrings(List<Map<String, String>> str) {
    final buffer = StringBuffer();

    if (str.isEmpty) {
      return AppLocale.current.closed;
    }

    for (var i = 0; i < str.length; i++) {
      buffer.write('${str[i].keys.first} - ${str[i].values.first}');

      if (i != str.length - 1) {
        buffer.write(', ');
      }
    }

    return buffer.toString();
  }
}

@freezed
class PickDayState with _$PickDayState {
  const factory PickDayState.initial({required DaysHours hours}) =
      InitialPickDay;
}
