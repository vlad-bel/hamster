import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/resend_otp_code_request.dart';

///UseCase for sending data to OTP service
abstract class OtpVerificationUseCase {
  ///verify new email
  Future<String> verifyEmail(OtpVerificationRequest request);

  ///resend confirmation code to OTP service
  Future<String> resendCode(ResendOtpCodeRequest request);
}
