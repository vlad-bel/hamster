import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/resend_otp_code_request.dart';
import 'package:business_terminal/use_cases/otp_verification/otp_verification_use_case.dart';

abstract class EmailVerificationUseCase implements OtpVerificationUseCase {
  @override
  Future<String> verifyEmail(OtpVerificationRequest request);

  @override
  Future<String> resendCode(ResendOtpCodeRequest request);
}
