import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/use_cases/forget_password/forget_password_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ForgetPasswordUseCase)
class ForgetPasswordUseCaseImpl extends ForgetPasswordUseCase {
  ForgetPasswordUseCaseImpl(this.restClient);

  final RestClient restClient;

  @override
  Future<String> sendVerificationCode(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    try {
      return await restClient
          .sendVerificationCode(forgetPasswordRequest.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'forget password verification code',
      );
    }
  }

  @override
  Future<String> verifyPhoneCode(
    ForgetPasswordSendCodeRequest forgetPasswordSendCodeRequest,
  ) async {
    try {
      return await restClient
          .verifyPhoneCode(forgetPasswordSendCodeRequest.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'forget password verification code',
      );
    }
  }

  @override
  Future<String> resendSmsCode(VerifyPhoneRequest verifyPhoneRequest) async {
    try {
      return await restClient.resendSMSCode(verifyPhoneRequest.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'forget password verification code',
      );
    }
  }
}
