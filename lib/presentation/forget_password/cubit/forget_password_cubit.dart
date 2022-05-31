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
      : super(ForgetPasswordState.initial());

  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordVerificationMethod? _method;
  String? _email;

  Future<void> sendVerificationCode(String emailMain) async {
    _email = emailMain;

    try {
      if (_method != null) {
        await _forgetPasswordUseCase.sendVerificationCode(
          ForgetPasswordRequest(email: emailMain, verificationMethod: _method!),
        );

        emit(ForgetPasswordState.sent(_method!));
      }
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  Future<void> confirmCode(String code, String email) async {
    try {
      await _forgetPasswordUseCase.confirmCode(
        _method!,
        ForgetPasswordSendCodeRequest(email, code),
      );

      emit(ForgetPasswordState.verified());
    } on ApiFailure catch (e) {
      emit(ForgetPasswordState.wrongCode());
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  Future<void> resendSmsCode(
    String email,
    ForgetPasswordVerificationMethod method,
  ) async {
    try {
      await _forgetPasswordUseCase.resendSmsCode(
        ForgetPasswordResendCodeRequest(method: method, email: email),
      );
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  void chooseTypeOfVerification(ForgetPasswordVerificationMethod method) {
    _method = method;
    emit(ForgetPasswordState.chosen(method));
  }

  Future<void> changePassword(String password) async {
    try {
      await _forgetPasswordUseCase.resetPassword(
        ResetPasswordRequest(email: _email!, password: password),
      );
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message.toString());
    }

    emit(ForgetPasswordState.newPasswordInstalled());
  }
}
