import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';

abstract class CompanyRepositoryMock {
  static RepCompany getMockCompany() {
    return RepCompany(
      rep: Rep(
        name: 'test',
        avatar: '',
        surname: 'test',
        fillingProgress: 1,
      ),
      company: Company(
        companyName: 'Hamster System',
        streetName: 'Streetname',
        streetNumber: '1',
        postalCode: '36037',
        city: 'Berlin',
      ),
      branch: Branch(
        fillingProgress: 1,
      ),
    );
  }
}
