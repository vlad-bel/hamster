import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_state.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CountryCodeSelectorCubit extends Cubit<CountryCodeSelectorState> {
  CountryCodeSelectorCubit({
    required this.useCase,
  }) : super(const CountryCodeSelectorState.loading()) {
    numberForm.valueChanges.listen((event) {
      final filterValue = (event![filterTextfield])! as String;
      filterCountryList(filterValue);
    });

    getCountryList();
  }

  static const numberTextfield = 'number';
  static const filterTextfield = 'filter';

  final numberForm = fb.group({
    numberTextfield: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
      ],
    ),
    filterTextfield: FormControl<String>(),
  });

  final NumberVerificationUseCase useCase;

  late final List<Country> cachedCountries;

  Future getCountryList() async {
    try {
      final countries = await useCase.getCountries();
      cachedCountries = countries.values.toList();
      emit(
        CountryCodeSelectorState.success(
          countries: countries.values.toList(),
        ),
      );
    } on ApiFailure catch (e) {
      emit(CountryCodeSelectorState.error(e));
    }
  }

  void showCountryList({Country? selectedCountry}) {
    state.whenOrNull(
      success: (_, countries) {
        emit(
          CountryCodeSelectorState.success(
            countries: countries,
            selectedCountry: selectedCountry,
          ),
        );
      },
    );
  }

  void filterCountryList(String value) {
    state.whenOrNull(
      success: (selectedCountry, countries) {
        emit(
          CountryCodeSelectorState.success(
            countries: cachedCountries
                .where((element) => element.name.startsWith(value))
                .toList(),
            selectedCountry: selectedCountry,
          ),
        );
      },
    );
  }

  void selectCountry(Country country) {
    state.whenOrNull(
      success: (_, countries) {
        emit(
          CountryCodeSelectorState.success(
            selectedCountry: country,
            countries: countries,
          ),
        );
      },
    );
  }
}
