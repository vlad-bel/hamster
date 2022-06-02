import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verify_phone_request.dart';
import 'package:business_terminal/domain/model/forget_password/reset_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/send_verification_code_response.dart';

abstract class ForgetPasswordUseCase {
  Future<SendVerificationCodeResponse> sendVerificationCode(
    ForgetPasswordRequest forgetPasswordRequest,
  );

  Future<String> confirmCode(
    ForgetPasswordVerificationMethod method,
    ForgetPasswordSendCodeRequest request,
  );

  Future<String> resendCode(
    ForgetPasswordResendCodeRequest resendCodeRequest,
  );

  Future<void> resetPassword(ResetPasswordRequest request);
}
