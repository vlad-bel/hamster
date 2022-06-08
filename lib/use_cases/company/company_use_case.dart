import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';

abstract class CompanyUsecase {
  Company? company;
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

  Future<Company> fetchCompany({
    required String companyId,
  });

  Future<Company> getCompany({
    required String companyId,
  });

  void dispose(){
    company = null;
    repCompany = null;
  }
}
