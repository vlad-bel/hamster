import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_number_response.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';

abstract class NumberVerificationUseCase {
  Future<Map<String, Country>> getCountries();

  Future verifyPhoneBy({
    required VerifyMethod method,
    required String email,
  });

  Future<VerifyNumberResponse> verifyNumber({
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
