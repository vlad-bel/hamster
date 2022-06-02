import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_logo_cropper_form_state.freezed.dart';

@freezed
class AddLogoCropperFormState with _$AddLogoCropperFormState {
  const factory AddLogoCropperFormState.init({
    required String text,
  }) = InitAddLogoCropperFormState;
  const factory AddLogoCropperFormState.success({
    required BackgroundColorModel backgroundColorModel,
  }) = SuccessAddLogoCropperFormState;
  const factory AddLogoCropperFormState.loading({
    required String text,
  }) = LoadingAddLogoCropperFormState;
  const factory AddLogoCropperFormState.hide({
    required String text,
  }) = HideAddLogoCropperFormState;
}
