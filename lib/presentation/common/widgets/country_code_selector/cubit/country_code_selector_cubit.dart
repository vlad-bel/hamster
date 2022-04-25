import 'package:business_terminal/data/model/country/country.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CountryCodeSelectorCubit extends Cubit<CountryCodeSelectorState> {
  CountryCodeSelectorCubit({
    required Function(String) onChange,
  }) : super(CountryCodeSelectorState()) {
    numberForm.valueChanges.listen((event) {
      if (state.selectedCountry != null) {
        final numberValue = (event![numberTextfield])! as String;
        final contryCode = state.selectedCountry!.countryCode;
        onChange(
          '${state.selectedCountry!.countryCode.substring(1, contryCode.length)}$numberValue',
        );
      }
      final filterValue = (event![filterTextfield])! as String;
      filterCountryList(filterValue);
    });
  }

  static const numberTextfield = 'number';
  static const filterTextfield = 'filter';

  final numberForm = fb.group({
    numberTextfield: FormControl<String>(value: ''),
    filterTextfield: FormControl<String>(),
  });

  ///mock data
  ///TODO add fetching country list from server
  final countryList = [
    Country(
      countryImage: Assets.imagesFlagsGer,
      countryName: 'Germany',
      countryCode: "+49",
    ),
    Country(
        countryImage: Assets.imagesFlagsGer,
        countryName: 'USA',
        countryCode: '+100'),
    Country(
        countryImage: Assets.imagesFlagsGer,
        countryName: 'GE',
        countryCode: '+599'),
    Country(
        countryImage: Assets.imagesFlagsGer,
        countryName: 'GE',
        countryCode: '+599'),
    Country(
        countryImage: Assets.imagesFlagsGer,
        countryName: 'GE',
        countryCode: '+599'),
    Country(
        countryImage: Assets.imagesFlagsGer,
        countryName: 'GE',
        countryCode: '+599'),
  ];

  void showCountryList({Country? selectedCountry}) {
    emit(CountryCodeSelectorOpenedState(
      countryList: countryList,
      selectedCountry: selectedCountry,
    ));
  }

  void filterCountryList(String value) {
    emit(
      CountryCodeSelectorOpenedState(
        selectedCountry: state.selectedCountry,
        countryList: countryList
            .where((element) => element.countryName.startsWith(value))
            .toList(),
      ),
    );
  }

  void selectCountry(Country country) {
    emit(CountryCodeSelectorState(selectedCountry: country));
  }
}
