import 'package:business_terminal/data/model/country/country.dart';

abstract class NumberVerificationUseCase{
  Future<Map<String, Country>> getCountries();
}