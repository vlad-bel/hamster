import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/categories/categories/categories_page.dart';

///UseCase for company management
abstract class CompanyUsecase {
  //cached full info about company
  //can be usefull for getting info about company around the project
  Company? company;

  ///cached common info about user, company and branches
  /////can be usefull for getting info about repCompany around the project
  RepCompany? repCompany;

  ///fetch new RepCompany info from backend
  Future<RepCompany> getRepCompany();

  ///create new company on backend
  ///return created Company entity
  Future<Company> createCompany({
    required String companyName,
    required String city,
    required String streetName,
    required String streetNumber,
    required String postalCode,
    required String country,
    required String countryCode,
  });

  ///fetch all categories
  ///uses on [CategoriesPage] flow for fetching all categories of new branch
  Future<List<String>> getCategories();

  ///fetch new [RepCompany] from backend
  ///update cached [repCompany] variable
  Future<RepCompany> fetchRepCompany();

  ///fetch new [Company] from backend
  ///update cached [company] variable
  Future<Company> fetchCompany({
    required String companyId,
  });

  ///get's cached or fetched company
  Future<Company> getCompany({
    required String companyId,
  });

  ///clear cache
  void dispose() {
    company = null;
    repCompany = null;
  }
}
