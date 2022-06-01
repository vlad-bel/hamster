import 'package:freezed_annotation/freezed_annotation.dart';

part 'cropper_state.freezed.dart';

@freezed
class CropperState with _$CropperState {
  const factory CropperState.init() = InitCropperState;
  const factory CropperState.loading() = LoadingCropperState;
}
