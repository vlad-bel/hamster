import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_selector_state.freezed.dart';

@freezed
class CountrySelectorState with _$CountrySelectorState {
  const factory CountrySelectorState.loading() = LoadingCountrySelectorState;

  const factory CountrySelectorState.open({
    Country? selectedCountry,
    List<Country>? countries,
  }) = SucessCountrySelectorState;

  const factory CountrySelectorState.close({
    Country? selectedCountry,
    List<Country>? countries,
  }) = CloseCountrySelectorState;

  const factory CountrySelectorState.error(ApiFailure e) =
      ErrorCountrySelectorState;
}
