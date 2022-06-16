import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verify_phone_request.dart';
import 'package:business_terminal/domain/model/forget_password/reset_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/send_verification_code_response.dart';

///Logic for [forget_password] flow
abstract class ForgetPasswordUseCase {
  ///Choose verification method and send confirmation code
  ///To sms,phone or email
  Future<SendVerificationCodeResponse> sendVerificationCode(
    ForgetPasswordRequest forgetPasswordRequest,
  );

  ///Confirm verification code
  ///That was be sent on [sendVerificationCode] request
  Future<String> confirmCode(
    ForgetPasswordVerificationMethod method,
    ForgetPasswordSendCodeRequest request,
  );

  ///Resend verification code to choosed method
  Future<String> resendCode(
    ForgetPasswordResendCodeRequest resendCodeRequest,
  );

  ///Confirm of reseting password
  ///Creates new password for user
  Future<void> resetPassword(ResetPasswordRequest request);
}
