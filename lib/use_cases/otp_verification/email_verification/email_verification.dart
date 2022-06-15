import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/resend_otp_code_request.dart';
import 'package:business_terminal/use_cases/otp_verification/otp_verification_use_case.dart';

///UseCase for verification of email
///Uses on [email_verification_flow]
abstract class EmailVerificationUseCase implements OtpVerificationUseCase {
  ///verificate created email by code
  @override
  Future<String> verifyEmail(OtpVerificationRequest request);

  ///resend verification code to created email
  @override
  Future<String> resendCode(ResendOtpCodeRequest request);
}
