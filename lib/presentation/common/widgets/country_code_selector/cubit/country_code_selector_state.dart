import 'package:business_terminal/data/model/country/country.dart';
import 'package:equatable/equatable.dart';

class CountryCodeSelectorState extends Equatable {
  CountryCodeSelectorState({this.selectedCountry});

  final Country? selectedCountry;

  @override
  List<Object?> get props => [selectedCountry];
}

class CountryCodeSelectorOpenedState extends CountryCodeSelectorState {
  CountryCodeSelectorOpenedState({
    Country? selectedCountry,
    required this.countryList,
  }) : super(
          selectedCountry: selectedCountry,
        );

  final List<Country> countryList;

  @override
  List<Object?> get props => [
        selectedCountry,
        countryList,
      ];
}
