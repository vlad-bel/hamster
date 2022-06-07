import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/create_phone_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/verify_phone_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/verify_sms_number_request.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: NumberVerificationUseCase)
class NumberVerificationUseCaseImpl extends NumberVerificationUseCase {
  NumberVerificationUseCaseImpl({
    required this.repository,
  });

  final RestClient repository;

  @override
  Future createPhone({
    required String email,
    required String phone,
  }) async {
    try {
      await repository.createPhone(
        CreatePhoneRequest(
          phone: phone,
          email: email,
        ).toJson(),
      );
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'createPhone',
      );
    }
  }

  @override
  Future<Map<String, Country>> fetchCountries() async {
    try {
      final response = await repository.getCountries();
      final countriesWithCodes = response.map(
        (key, value) => MapEntry(
          key,
          value.copyWith(
            code: key,
          ),
        ),
      );
      countries = countriesWithCodes;

      return countriesWithCodes;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'createPhone',
      );
    }
  }

  @override
  Future<Map<String, Country>> getCountries() async {
    if (countries != null) {
      return countries!;
    }
    return fetchCountries();
  }

  @override
  Future<void> resendSMSCode({
    required String email,
    required VerifyMethod method,
  }) async {
    try {
      await repository.resendSMSCode(
        VerifyPhoneRequest(
          verifyMethod: method.string,
          email: email,
        ).toJson(),
      );
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'resendSMSCode',
      );
    }
  }

  @override
  Future<String> verifyNumber({
    required String email,
    required String code,
  }) async {
    try {
      final response = await repository.verifyNumber(
        VerifySmsNumberRequest(
          code: code,
          credential: email,
        ).toJson(),
      );

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'verifyNumber',
      );
    }
  }

  @override
  Future verifyPhoneBy({
    required VerifyMethod method,
    required String email,
  }) {
    try {
      return repository.verifyPhoneBy(
        VerifyPhoneRequest(
          verifyMethod: method.string,
          email: email,
        ).toJson(),
      );
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'createPhone',
      );
    }
  }
}
