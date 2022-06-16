import 'package:business_terminal/domain/model/file/app_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_personal_data_state.freezed.dart';

@freezed
class EditPersonalDataState with _$EditPersonalDataState {
  const factory EditPersonalDataState({
    required AppImage? avatar,
    required bool loading,
  }) = _EditPersonalDataState;

  factory EditPersonalDataState.initial() => const EditPersonalDataState(
        avatar: null,
        loading: true,
      );

  factory EditPersonalDataState.mock() => const EditPersonalDataState(
        avatar: null,
        loading: false,
      );
}
