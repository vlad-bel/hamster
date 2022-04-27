import 'package:business_terminal/data/gateway/rest_client.dart';
import 'package:business_terminal/data/model/country/country.dart';
import 'package:business_terminal/domain/use_cases/number_verification/number_verification_use_case.dart';

class NumberVerificationUseCaseImpl extends NumberVerificationUseCase {
  NumberVerificationUseCaseImpl({
    required this.repository,
  });

  final RestClient repository;

  @override
  Future<Map<String, Country>> getCountries() {
    return repository.getCountries();
  }
}
