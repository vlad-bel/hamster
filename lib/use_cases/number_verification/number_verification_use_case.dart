import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/verify_phone_request.dart';
import 'package:business_terminal/use_cases/otp_verification/otp_verification_use_case.dart';

///UseCase for verification number
///Uses for registration flow
abstract class NumberVerificationUseCase implements OtpVerificationUseCase {
  ///Cached map of countries
  Map<String, Country>? countries;

  ///Gets cached or feteched countries map
  Future<Map<String, Country>> getCountries();

  ///Fetch new countries from backend
  Future<Map<String, Country>> fetchCountries();

  ///Choose verification method for new phone
  Future verifyPhoneBy({
    required VerifyMethod method,
    required String email,
  });

  ///Send verification code for new phone
  Future<String> verifyNumber({
    required String email,
    required String code,
  });

  ///Resend verification code to new phone
  Future<void> resendSMSCode({
    required String email,
    required VerifyMethod method,
  });

  ///Init of creating new phone
  Future createPhone({
    required String email,
    required String phone,
  });
}
