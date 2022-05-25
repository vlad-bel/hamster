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
      await _tokenRepository.getAccessToken();

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
  Future<Company> fetchCompany({
    required String companyId,
  }) async {
    try {
      final _company = await _repository.fetchCompany(
        companyId,
      );
      company = _company;
      return _company;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'fetchCompany',
      );
    }
  }

  @override
  Future<RepCompany> fetchRepCompany() async {
    try {
      final _repCompany = await _repository.repCompany();
      repCompany = _repCompany;
      return _repCompany;
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'fetchRepCompany',
      );
    }
  }

  @override
  Future<Company> getCompany({
    required String companyId,
  }) async {
    try {
      if (company != null) {
        return company!;
      } else {
        return await fetchCompany(
          companyId: companyId,
        );
      }
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'getCompany',
      );
    }
  }

  @override
  Future<RepCompany> getRepCompany() async {
    try {
      if (repCompany != null) {
        return repCompany!;
      } else {
        return await fetchRepCompany();
      }
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'getRepCompany',
      );
    }
  }
}
