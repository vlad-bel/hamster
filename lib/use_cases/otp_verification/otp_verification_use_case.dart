import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/resend_otp_code_request.dart';

abstract class OtpVerificationUseCase {
  Future<String> verifyEmail(OtpVerificationRequest request);

  Future<String> resendCode(ResendOtpCodeRequest request);
}
