part of 'forget_password_cubit.dart';

@freezed
abstract class ForgetPasswordState with _$ForgetPasswordState {
  /// Initial state. ChooseVerifyPage is on the screen
  /// ForgetPasswordEmailPage is on the screen
  const factory ForgetPasswordState.initial() = _$Initial;

  /// Password recovering method is clicked on, but not selected yet
  const factory ForgetPasswordState.chosen(
    ForgetPasswordVerificationMethod method,
  ) = _$Chosen;

  /// Recovering OTP is sent.
  /// PinCodePasswordResetPage is on the screen
  const factory ForgetPasswordState.sent(
    ForgetPasswordVerificationMethod method,
    String? phoneNumber,
  ) = _$Sent;

  /// Is emitted when otp code is wrong
  const factory ForgetPasswordState.wrongCode(
    ForgetPasswordVerificationMethod method,
    String? phoneNumber,
  ) = _$WrongCode;

  /// OTP is right. Route to ConfirmNewPasswordPage
  const factory ForgetPasswordState.verified() = _$Verified;

  /// New otp is sent to user device
  const factory ForgetPasswordState.resent(
    ForgetPasswordVerificationMethod method,
    String? phoneNumber,
  ) = _$Resent;

  /// New password installed successfully. Route back to login page
  const factory ForgetPasswordState.newPasswordInstalled() =
      _$NewPasswordInstalled;

  const factory ForgetPasswordState.loading() = _$Loading;

  const factory ForgetPasswordState.error(String errorMessage) = _$Error;

  const factory ForgetPasswordState.chooseVerificationMethod() =
      _$ChooseVerificationMethod;
}
