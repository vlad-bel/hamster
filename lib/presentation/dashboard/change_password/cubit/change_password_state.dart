import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _$Initial;

  const factory ChangePasswordState.success() = _$Success;

  const factory ChangePasswordState.error(String message) = _$Error;

  const factory ChangePasswordState.currentPasswordIncorrect() =
      _$CurrentPasswordIncorrect;

  const factory ChangePasswordState.loading() = _$Loading;
}
