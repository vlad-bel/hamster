import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_logo_cropper_form_state.freezed.dart';

@freezed
class AddLogoCropperFormState with _$AddLogoCropperFormState {
  const factory AddLogoCropperFormState.hide({
    required String text,
  }) = _$HideAddLogoCropperFormState;

  const factory AddLogoCropperFormState.init({
    required String text,
  }) = _$InitAddLogoCropperFormState;

  const factory AddLogoCropperFormState.loading({
    required String text,
  }) = _$LoadingAddLogoCropperFormState;

  const factory AddLogoCropperFormState.success({
    required List<String> palette,
    required String color,
  }) = _$SuccessAddLogoCropperFormState;
}
