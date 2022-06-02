import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_logo_cropper_state.freezed.dart';

@freezed
class AddLogoCropperState with _$AddLogoCropperState {
  const factory AddLogoCropperState.init() = InitAddLogoCropperState;
  const factory AddLogoCropperState.loading() = LoadingAddLogoCropperState;
}
