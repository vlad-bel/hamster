import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/company/company_request_body.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CompanyUsecase)
class CompanyUseCaseImpl extends CompanyUsecase {
  CompanyUseCaseImpl(this.repository);

  final RestClient repository;

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
      return await repository.createCompany(
        CompanyRequestBody(
          companyName: companyName,
          city: city,
          streetName: streetName,
          streetNumber: streetNumber,
          postalCode: postalCode,
          country: country,
          countryCode: countryCode,
        ).toJson(),

        ///TODO PUT TEMPORARY TOKEN HERE
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG4uZG9lQHRlc3QxMC5jb20iLCJyb2xlcyI6WyJyZXByZXNlbnRhdGl2ZSJdLCJpYXQiOjE2NTIzNjMxMTgsImV4cCI6MTY1MjM2ODUxOH0.XeTcWOCSbtYPsP5jZX0ym31gNa-nfB-MflT2Pp9-5t8",
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
      return await repository.repCompany(

          ///TODO PUT TEMPORARY TOKEN HERE
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvaG4uZG9lQHRlc3QxMC5jb20iLCJyb2xlcyI6WyJyZXByZXNlbnRhdGl2ZSJdLCJpYXQiOjE2NTIzNjMxMTgsImV4cCI6MTY1MjM2ODUxOH0.XeTcWOCSbtYPsP5jZX0ym31gNa-nfB-MflT2Pp9-5t8');
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'getRepCompany',
      );
    }
  }
}
