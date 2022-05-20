import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_state.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@singleton
class CountryCodeSelectorCubit extends Cubit<CountryCodeSelectorState> {
  CountryCodeSelectorCubit({
    required this.useCase,
  }) : super(const CountryCodeSelectorState.loading()) {
    numberForm.valueChanges.listen((event) {
      final filterValue = (event![filterTextfield])! as String;
      filterCountryList(filterValue);
    });
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
        CountryCodeSelectorState.init(
          countries: countries.values.toList(),
        ),
      );
    } on ApiFailure catch (e) {
      emit(CountryCodeSelectorState.error(e));
    }
  }

  void showCountryList({Country? selectedCountry}) {
    state.whenOrNull(
      init: (_, countries) {
        emit(
          CountryCodeSelectorState.open(
            countries: countries,
            selectedCountry: selectedCountry,
          ),
        );
      },
    );
  }

  void filterCountryList(String value) {
    state.whenOrNull(
      open: (selectedCountry, countries) {
        emit(
          CountryCodeSelectorState.open(
            countries: cachedCountries
                .where(
                  (element) => element.name.toLowerCase().startsWith(
                        value.toLowerCase(),
                      ),
                )
                .toList(),
            selectedCountry: selectedCountry,
          ),
        );
      },
    );
  }

  void selectCountry(Country country) {
    state.whenOrNull(
      open: (_, countries) {
        numberForm.control(numberTextfield).setValidators([
          Validators.maxLength(15 - country.phone.length),
          Validators.minLength(10 - country.phone.length),
        ]);
        emit(
          CountryCodeSelectorState.init(
            selectedCountry: country,
            countries: countries,
          ),
        );
      },
    );
  }
}
