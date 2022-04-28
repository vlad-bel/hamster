import 'package:business_terminal/data/model/registration/email_verification/resend_email_code_request.dart';

abstract class ResendEmailCodeUseCase {
  Future<String> resendEmailCode(ResendEmailCodeRequest request);
}
