part of 'forget_password_cubit.dart';

@freezed
abstract class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;

  const factory ForgetPasswordState.choosen(String type) = Choosen;

  const factory ForgetPasswordState.sended(String type) = Sended;

  const factory ForgetPasswordState.wrongCode() = WrongCode;

  const factory ForgetPasswordState.verified() = Verified;

  const factory ForgetPasswordState.resended() = Resended;
}
