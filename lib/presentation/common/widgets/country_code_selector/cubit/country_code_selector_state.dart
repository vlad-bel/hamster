import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code_selector_state.freezed.dart';

@freezed
abstract class CountryCodeSelectorState with _$CountryCodeSelectorState {
  const factory CountryCodeSelectorState.loading() =
      LoadingCountryCodeSelectorState;

  const factory CountryCodeSelectorState.success({
    Country? selectedCountry,
    List<Country>? countries,
  }) = SucessCountryCodeSelectorState;

  const factory CountryCodeSelectorState.error(ApiFailure e) =
      ErrorCountryCodeSelectorState;
}
