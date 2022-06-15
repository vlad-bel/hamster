import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/verify_phone_request.dart';
import 'package:business_terminal/use_cases/otp_verification/otp_verification_use_case.dart';

abstract class NumberVerificationUseCase implements OtpVerificationUseCase {
  Map<String, Country>? countries;

  Future<Map<String, Country>> getCountries();

  Future<Map<String, Country>> fetchCountries();

  Future verifyPhoneBy({
    required VerifyMethod method,
    required String email,
  });

  Future<String> verifyNumber({
    required String email,
    required String code,
  });

  Future<void> resendSMSCode({
    required String email,
    required VerifyMethod method,
  });

  Future createPhone({
    required String email,
    required String phone,
  });
}
