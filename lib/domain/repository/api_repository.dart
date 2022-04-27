// ignore_for_file: one_member_abstracts

import 'package:business_terminal/data/model/registration/email_verification/email_verification_request.dart';
import 'package:business_terminal/data/model/registration/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/data/model/registration/user_info_request.dart';

abstract class ApiRepository {
  Future<String> initUserInfoCreation(
    UserInfoRequest request,
  );

  Future<String> emailVerification(
    EmailVerificationRequest request,
  );

  Future<String> resendEmailCode(
    ResendEmailCodeRequest request,
  );
}
