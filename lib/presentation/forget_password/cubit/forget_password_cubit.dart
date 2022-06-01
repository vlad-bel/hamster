import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verify_phone_request.dart';
import 'package:business_terminal/domain/model/forget_password/reset_password_request.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/forget_password/forget_password_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_cubit.freezed.dart';

part 'forget_password_state.dart';

@Singleton()
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordUseCase)
      : super(const ForgetPasswordState.initial());

  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordVerificationMethod? _method;
  String? _email;
  String? _phoneNumber;

  Future<void> sendVerificationCode(String emailMain) async {
    try {
      if (_method != null) {
        emit(const ForgetPasswordState.loading());

        final result = await _forgetPasswordUseCase.sendVerificationCode(
          ForgetPasswordRequest(email: emailMain, verificationMethod: _method!),
        );

        _phoneNumber = result.maskedPhone;

        emit(ForgetPasswordState.sent(_method!, _phoneNumber));
      }
    } on ApiFailure catch (e) {
      emit(ForgetPasswordState.error(e.response.message.toString()));
    }
  }

  Future<void> confirmCode(String code, String email) async {
    try {
      emit(const ForgetPasswordState.loading());

      await _forgetPasswordUseCase.confirmCode(
        _method!,
        ForgetPasswordSendCodeRequest(email, code),
      );

      emit(const ForgetPasswordState.verified());
    } on ApiFailure catch (e) {
      emit(ForgetPasswordState.wrongCode(_method!, _phoneNumber));
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  Future<void> resendSmsCode(
    String email,
    ForgetPasswordVerificationMethod method,
  ) async {
    try {
      await _forgetPasswordUseCase.resendCode(
        ForgetPasswordResendCodeRequest(method: method, email: email),
      );
      emit(ForgetPasswordState.resent(method, _phoneNumber));
    } on ApiFailure catch (e) {
      emit(ForgetPasswordState.error(e.response.message.toString()));
    }
  }

  void chooseTypeOfVerification(ForgetPasswordVerificationMethod method) {
    _method = method;
    emit(ForgetPasswordState.chosen(method));
  }

  Future<void> changePassword(String password) async {
    try {
      emit(const ForgetPasswordState.loading());
      await _forgetPasswordUseCase.resetPassword(
        ResetPasswordRequest(email: _email!, password: password),
      );
      emit(const ForgetPasswordState.newPasswordInstalled());
    } on ApiFailure catch (e) {
      emit(ForgetPasswordState.error(e.response.message.toString()));
    }
  }

  void onEmailTyped(String email) {
    _email = email;
    emit(const ForgetPasswordState.chooseVerificationMethod());
  }
}
