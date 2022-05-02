import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_maps_webservice/places.dart';

@singleton
class CountrySelectorCubit extends Cubit<CountrySelectorState> {
  CountrySelectorCubit({
    required this.useCase,
  }) : super(const CountrySelectorState.loading()) {
    numberForm.valueChanges.listen((event) {
      final filterValue = (event![filterTextfield])! as String;
      filterCountryList(filterValue);
    });

    getCountryList();
  }

  static const countryField = 'country';
  static const filterTextfield = 'filter';

  final numberForm = fb.group({
    countryField: FormControl<String>(
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
        CountrySelectorState.success(
          countries: countries.values.toList(),
        ),
      );
    } on ApiFailure catch (e) {
      emit(CountrySelectorState.error(e));
    }
  }

  void showCountryList({Country? selectedCountry}) {
    state.whenOrNull(
      success: (_, countries) {
        emit(
          CountrySelectorState.success(
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
          CountrySelectorState.success(
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
        numberForm.control(countryField).value =
            ' ${country.emoji}  ${country.name}';
        emit(
          CountrySelectorState.success(
            selectedCountry: country,
            countries: countries,
          ),
        );
      },
    );
  }

  void selectCountryFromPrediction(Prediction prediction) {
    state.whenOrNull(
      success: (_, countries) {
        final predictionContry = prediction.description!.split(',').last.trim();
        ///TODO WARNING
        /// Here we can face with bug of finding needed country
        /// because some countries have different names into Google Api and  into our backend
        /// ----example-----
        /// Need to find USA country
        /// Google Api -> USA
        /// Our backend -> United states
        /// USA != United states
        /// ----solving-----
        /// Need of some unification with google api and our backend
        /// for example need to add placeId or something like that
        /// and make check by this parameter, not by name
        final country = countries?.firstWhere(
          (element) => element.name.startsWith(predictionContry),
        );

        numberForm.control(countryField).value =
            ' ${country?.emoji}  ${country?.name}';

        emit(
          CountrySelectorState.success(
            selectedCountry: country,
            countries: countries,
          ),
        );
      },
    );
  }
}
