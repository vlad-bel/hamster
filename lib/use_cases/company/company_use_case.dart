import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';

abstract class CompanyUsecase {
  RepCompany? repCompany;

  Future<RepCompany> getRepCompany();

  Future<Company> createCompany({
    required String companyName,
    required String city,
    required String streetName,
    required String streetNumber,
    required String postalCode,
    required String country,
    required String countryCode,
  });

  Future<List<String>> getCategories();

  Future<RepCompany> fetchRepCompany();
}
