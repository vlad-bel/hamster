import 'package:business_terminal/data/model/country/country.dart';
import 'package:business_terminal/domain/core/errors/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code_cubit.freezed.dart';

class CountryCodeCubit extends Cubit<CountryCodeState> {
  CountryCodeCubit() : super(const CountryCodeState.loading()) {}
}

@freezed
class CountryCodeState with _$CountryCodeState {
  const factory CountryCodeState.loading() = LoadingCountryCodeState;

  const factory CountryCodeState.success(
    Map<String, Country> countries,
  ) = SucessCountryCodeState;

  const factory CountryCodeState.error(ApiFailure e) = ErrorCountryCodeState;
}
