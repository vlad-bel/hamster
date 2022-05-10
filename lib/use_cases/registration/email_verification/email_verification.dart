import 'package:business_terminal/domain/request_model/registration/email_verification/email_verification_request.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/resend_email_code_request.dart';

abstract class EmailVerificationUseCase {
  Future<String> verifyEmail(EmailVerificationRequest request);

  Future<String> resendCode(ResendEmailCodeRequest request);
}
