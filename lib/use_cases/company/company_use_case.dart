import 'package:business_terminal/domain/model/company/company.dart';

abstract class CompanyUsecase {
  Future<Company> createCompany({
    required String companyName,
    required String city,
    required String streetName,
    required String streetNumber,
    required String postalCode,
    required String country,
    required String countryCode,
  });
}
