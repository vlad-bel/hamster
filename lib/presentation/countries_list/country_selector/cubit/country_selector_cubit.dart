import 'package:business_terminal/data/model/country/country.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../generated/assets.dart';

class CountrySelectorState extends Equatable {
  CountrySelectorState({this.selectedCountry});

  final Country? selectedCountry;

  @override
  List<Object?> get props => [selectedCountry];
}

class CountrySelectorOpenedState extends CountrySelectorState {
  CountrySelectorOpenedState({
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

class CountrySelectorCubit extends Cubit<CountrySelectorState> {
  CountrySelectorCubit() : super(CountrySelectorState()) {
    numberForm.valueChanges.listen((event) {
      // print('event: ${event![filterTextfield]}');
      filterCountryList(event![filterTextfield] as String);
    });
  }

  static const numberTextfield = 'number';
  static const filterTextfield = 'filter';

   final numberForm = fb.group({
    numberTextfield: FormControl<String>(value: ''),
    filterTextfield: FormControl<String>(),
  });


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
    emit(CountrySelectorOpenedState(
      countryList: countryList,
      selectedCountry: selectedCountry,
    ));
  }

  void filterCountryList(String value) {
    emit(
      CountrySelectorOpenedState(
        selectedCountry: state.selectedCountry,
        countryList: countryList
            .where((element) => element.countryName.startsWith(value))
            .toList(),
      ),
    );
  }

  void selectCountry(Country country) {
    emit(CountrySelectorState(selectedCountry: country));
  }
}
