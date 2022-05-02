import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_selector_state.freezed.dart';

@freezed
abstract class CountrySelectorState with _$CountrySelectorState {
  const factory CountrySelectorState.loading() = LoadingCountrySelectorState;

  const factory CountrySelectorState.success({
    Country? selectedCountry,
    List<Country>? countries,
  }) = SucessCountrySelectorState;

  const factory CountrySelectorState.error(ApiFailure e) =
      ErrorCountrySelectorState;
}
