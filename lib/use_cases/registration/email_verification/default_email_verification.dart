import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/resend_otp_code_request.dart';
import 'package:business_terminal/use_cases/registration/email_verification/email_verification.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: EmailVerificationUseCase)
class DefaultEmailVerificationUseCase implements EmailVerificationUseCase {
  DefaultEmailVerificationUseCase(this._client);

  final RestClient _client;

  @override
  Future<String> verifyEmail(OtpVerificationRequest request) async {
    try {
      final req = request.toJson();
      final response = await _client.verifyEmailCode(req);

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'verifyEmail',
      );
    }
  }

  @override
  Future<String> resendCode(ResendOtpCodeRequest request) async {
    try {
      final req = request.toJson();
      final response = await _client.resendEmailCode(req);

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'resendCode',
      );
    }
  }
}
