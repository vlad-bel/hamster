import 'package:business_terminal/domain/request_model/registration/email_verification/resend_email_code_request.dart';

abstract class ResendEmailCodeUseCase {
  Future<String> resendEmailCode(ResendEmailCodeRequest request);
}
