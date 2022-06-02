part of 'forget_password_cubit.dart';

@freezed
abstract class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _$Initial;

  const factory ForgetPasswordState.chosen(
    ForgetPasswordVerificationMethod method,
  ) = _$Chosen;

  const factory ForgetPasswordState.sent(
    ForgetPasswordVerificationMethod method,
    String? phoneNumber,
  ) = _$Sent;

  const factory ForgetPasswordState.wrongCode(
    ForgetPasswordVerificationMethod method,
    String? phoneNumber,
  ) = _$WrongCode;

  const factory ForgetPasswordState.verified() = _$Verified;

  const factory ForgetPasswordState.resent(
    ForgetPasswordVerificationMethod method,
    String? phoneNumber,
  ) = _$Resent;

  const factory ForgetPasswordState.newPasswordInstalled() =
      _$NewPasswordInstalled;

  const factory ForgetPasswordState.loading() = _$Loading;

  const factory ForgetPasswordState.error(String errorMessage) = _$Error;

  const factory ForgetPasswordState.chooseVerificationMethod() =
      _$ChooseVerificationMethod;
}
