import 'dart:convert';

import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/number_verification/create_phone_request.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_number_response.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_sms_number_request.dart';
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
  Future<Map<String, Country>> getCountries() {
    return repository.getCountries();
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
        ApiFailureResponse.fromJson(e.response!.data as Map<String, dynamic>),
        'createPhone',
      );
    }
  }

  @override
  Future createPhone({
    required String email,
    required String phone,
  }) async {
    try {
      final response = await repository.createPhone(
        CreatePhoneRequest(
          phone: phone,
          email: email,
        ).toJson(),
      );
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e.response!.data as Map<String, dynamic>),
        'createPhone',
      );
    }
  }

  @override
  Future<VerifyNumberResponse> verifyNumber({
    required String email,
    required String code,
  }) async {
    try {
      final response = await repository.verifyNumber(
        VerifySmsNumberRequest(
          code: code,
          email: email,
        ).toJson(),
      );

      return response;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e.response!.data as Map<String, dynamic>),
        'verifyNumber',
      );
    }
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
      final dynamic error = e.response?.data;
      print("error:$error errorType: ${error.runtimeType}");
      throw ApiFailure(
        ApiFailureResponse.fromJson(
          jsonDecode(e.response!.data as String) as Map<String, dynamic>,
        ),
        'resendSMSCode',
      );
    }
  }
}
