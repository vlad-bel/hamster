import 'package:business_terminal/domain/model/forget_password/forget_password_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_send_code_request.dart';
import 'package:business_terminal/domain/model/forget_password/forget_password_verify_phone_request.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';

abstract class ForgetPasswordUseCase {
  Future<String> sendVerificationCode(
    ForgetPasswordRequest forgetPasswordRequest,
  );

  Future<String> verifyPhoneCode(
    ForgetPasswordSendCodeRequest forgetPasswordSendCodeRequest,
  );

  Future<String> resendSmsCode(
    ForgetPasswordVerifyPhoneRequest verifyPhoneRequest,
  );
}
