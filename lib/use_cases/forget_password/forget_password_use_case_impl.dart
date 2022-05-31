import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verify_phone_request.dart';
import 'package:business_terminal/use_cases/forget_password/forget_password_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ForgetPasswordUseCase)
class ForgetPasswordUseCaseImpl extends ForgetPasswordUseCase {
  ForgetPasswordUseCaseImpl(this._restClient);

  final RestClient _restClient;

  @override
  Future<String> sendVerificationCode(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    try {
      return await _restClient
          .sendVerificationCode(forgetPasswordRequest.toJson());
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
  Future<String> resendSmsCode(
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
}
