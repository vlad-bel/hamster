import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verify_phone_request.dart';
import 'package:business_terminal/domain/model/forget_password/reset_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/send_verification_code_response.dart';
import 'package:business_terminal/use_cases/forget_password/forget_password_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ForgetPasswordUseCase)
class ForgetPasswordUseCaseImpl extends ForgetPasswordUseCase {
  ForgetPasswordUseCaseImpl(this._restClient);

  final RestClient _restClient;

  @override
  Future<SendVerificationCodeResponse> sendVerificationCode(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    try {
      if (forgetPasswordRequest.verificationMethod ==
          ForgetPasswordVerificationMethod.email) {
        await _restClient.sendVerificationCode(forgetPasswordRequest.toJson());
        return SendVerificationCodeResponse();
      } else {
        return await _restClient
            .sendPhoneVerificationCode(forgetPasswordRequest.toJson());
      }
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'forget password verification code',
      );
    }
  }

  @override
  Future<String> confirmCode(
    ForgetPasswordVerificationMethod method,
    ForgetPasswordSendCodeRequest request,
  ) async {
    try {
      if (method == ForgetPasswordVerificationMethod.email) {
        return await _restClient.verifyEmailCode(request.toJson());
      } else {
        return await _restClient.verifyPhoneCode(request.toJson());
      }
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'forget password verification code',
      );
    }
  }

  @override
  Future<String> resendCode(
    ForgetPasswordResendCodeRequest resendCodeRequest,
  ) async {
    try {
      return await _restClient.resendSMSCode(resendCodeRequest.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'forget password verification code',
      );
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    try {
      return await _restClient.resetPassword(request.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'forget password verification code',
      );
    }
  }
}
