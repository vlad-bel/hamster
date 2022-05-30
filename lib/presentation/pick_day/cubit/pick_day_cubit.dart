import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/presentation/pick_day/form_validation/pick_day_form_validation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'pick_day_cubit.freezed.dart';

@injectable
class PickDayCubit extends Cubit<PickDayState> {
  PickDayCubit() : super(PickDayState.initial());

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
}

@freezed
class PickDayState with _$PickDayState {
  const factory PickDayState.initial() = InitialPickDay;

  const factory PickDayState.success(LoginResponse response) = SuccessPickDay;

  const factory PickDayState.error(ApiFailure failure) = ErrorPickDay;
}
