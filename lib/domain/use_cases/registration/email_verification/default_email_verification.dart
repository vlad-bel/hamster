import 'package:business_terminal/data/model/registration/email_verification/email_verification_request.dart';
import 'package:business_terminal/data/model/registration/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/domain/use_cases/registration/email_verification/email_verification.dart';

class DefaultEmailVerificationUseCase implements EmailVerificationUseCase {
  DefaultEmailVerificationUseCase(this.apiService);

  final ApiRepository apiService;

  @override
  Future<String> verifyEmail(EmailVerificationRequest request) async {
    final response = await apiService.emailVerification(request);

    return response;
  }

  @override
  Future<String> resendCode(ResendEmailCodeRequest request) async {
    final response = await apiService.resendEmailCode(request);

    return response;
  }
}
