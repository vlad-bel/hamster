import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/presentation/add_opening_hours/form_validation/add_opening_hours_form_validation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_opening_hours_cubit.freezed.dart';

@injectable
class AddOpeningHoursCubit extends Cubit<AddOpeningHoursState> {
  AddOpeningHoursCubit() : super(AddOpeningHoursState.initial());

  final formSettings = AddOpeningHoursFormSettings();
  int counter = 1;
}

@freezed
class AddOpeningHoursState with _$AddOpeningHoursState {
  const factory AddOpeningHoursState.initial() = InitialAddOpeningHours;

  const factory AddOpeningHoursState.added() = AddedAddOpeningHours;

  const factory AddOpeningHoursState.success(LoginResponse response) =
      SuccessAddOpeningHours;

  const factory AddOpeningHoursState.error(ApiFailure failure) =
      ErrorAddOpeningHours;
}
