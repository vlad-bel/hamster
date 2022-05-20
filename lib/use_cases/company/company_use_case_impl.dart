import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/repository/token/token_repository.dart';
import 'package:business_terminal/domain/request_model/company/company_request_body.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CompanyUsecase)
class CompanyUseCaseImpl extends CompanyUsecase {
  CompanyUseCaseImpl(this._repository, this._tokenRepository);

  final RestClient _repository;
  final TokenRepository _tokenRepository;

  @override
  Future<Company> createCompany({
    required String companyName,
    required String city,
    required String streetName,
    required String streetNumber,
    required String postalCode,
    required String country,
    required String countryCode,
  }) async {
    try {
      final accessToken = await _tokenRepository.getAccessToken() ?? '';

      return await _repository.createCompany(
        CompanyRequestBody(
          companyName: companyName,
          city: city,
          streetName: streetName,
          streetNumber: streetNumber,
          postalCode: postalCode,
          country: country,
          countryCode: countryCode,
        ).toJson(),
      );
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'createCompany',
      );
    }
  }

  @override
  Future<RepCompany> getRepCompany() async {
    try {
      final repCopany = await _repository.repCompany(); // TODO rename
      repCompany = repCopany;
      return repCopany;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'getRepCompany',
      );
    }
  }
}
