import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/email_verification_request.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/use_cases/registration/email_verification/email_verification.dart';
import 'package:dio/dio.dart';

class DefaultEmailVerificationUseCase implements EmailVerificationUseCase {
  DefaultEmailVerificationUseCase(this.apiService);

  final ApiRepository apiService;

  @override
  Future<String> verifyEmail(EmailVerificationRequest request) async {
    try {
      final response = await apiService.emailVerification(request);

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(
          e.response!.data as Map<String, dynamic>,
        ),
        'verifyEmail',
      );
    }
  }

  @override
  Future<String> resendCode(ResendEmailCodeRequest request) async {
    try {
      final response = await apiService.resendEmailCode(request);

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(
          e.response!.data as Map<String, dynamic>,
        ),
        'resendCode',
      );
    }
  }
}
