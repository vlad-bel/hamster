import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:business_terminal/use_cases/profile/profile_viewing/profile_viewing_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProfileViewingUsecase)
class ProfileViewingUsecaseImpl extends ProfileViewingUsecase {
  ProfileViewingUsecaseImpl({
    required this.companyUsecase,
  });

  final CompanyUsecase companyUsecase;

  @override
  Future<RepCompany> getCompanyData() async {
    try {
      return await companyUsecase.getRepCompany();
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'getCompanyData',
      );
    }
  }
}
