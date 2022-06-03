import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/temp/pos_raw.dart';
import 'package:business_terminal/presentation/add_pos/form_validation/add_pos_form_validation.dart';
import 'package:business_terminal/presentation/branch_profile/widget/drop_down_select_entrances_count.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'add_pos_cubit.freezed.dart';

@injectable
class AddPosCubit extends Cubit<AddPosState> {
  AddPosCubit() : super(const AddPosState.initial());

  final formSettings = AddPosFormSettings();

  PosRaw generatePos(FormGroup form) {
    final pos = PosRaw(
      manufacturer: form
          .control(AddPosFormSettings.cashRegisterManufacturerField)
          .value as String,
      model: form.control(AddPosFormSettings.modelField).value as String,
      tillCount: (form.control(AddPosFormSettings.posNumberField).value
              as PlaceEntranceCount)
          .data,
    );

    return pos;
  }
}

@freezed
class AddPosState with _$AddPosState {
  const factory AddPosState.initial() = InitialAddPos;
}
