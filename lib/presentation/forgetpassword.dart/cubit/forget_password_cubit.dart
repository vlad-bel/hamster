import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/forget_password/forget_password_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordUseCase)
      : super(ForgetPasswordState.initial());

  final ForgetPasswordUseCase _forgetPasswordUseCase;
  String? type;

  Future<void> sendVerificationCode(String emailMain) async {
    try {
      if (type != null) {
        await _forgetPasswordUseCase
            .sendVerificationCode(ForgetPasswordRequest(emailMain, type!));

        emit(Sended(type!));
      }
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  Future<void> verifyPhoneCode(String code, String email) async {
    try {
      await _forgetPasswordUseCase
          .verifyPhoneCode(ForgetPasswordSendCodeRequest(email, code));

      emit(const Verified());
    } on ApiFailure catch (e) {
      emit(const WrongCode());
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  Future<void> resendSmsCode(String email, String type) async {
    try {
      print(type);
      await _forgetPasswordUseCase
          .resendSmsCode(VerifyPhoneRequest(verifyMethod: type, email: email));
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message.toString());
    }
  }

  void chooseTypeOfVerification(String typeOfVerification) {
    type = typeOfVerification;
    emit(Choosen(typeOfVerification));
  }
}
