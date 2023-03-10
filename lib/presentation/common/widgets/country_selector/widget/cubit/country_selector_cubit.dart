import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/use_cases/otp_verification/number_verification/number_verification_use_case.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@singleton
class CountrySelectorCubit extends Cubit<CountrySelectorState> {
  CountrySelectorCubit({
    required this.useCase,
  }) : super(const CountrySelectorState.loading()) {
    countryForm.valueChanges.listen((event) {
      final filterValue = event![filterTextfield];
      filterCountryList(filterValue.toString());
    });

    getCountryList();
  }

  static const countryField = 'country';
  static const filterTextfield = 'filter';

  List<Country>? cachedCountries;

  static final validationMessages = {
    ValidationMessage.required: AppLocale.current.required_field,
  };

  final countryForm = fb.group({
    countryField: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
      ],
    ),
    filterTextfield: FormControl<String>(),
  });

  final NumberVerificationUseCase useCase;

  Future getCountryList() async {
    try {
      final countries = await useCase.getCountries();
      cachedCountries = countries.values.toList();
      emit(
        CountrySelectorState.close(
          countries: countries.values.toList(),
        ),
      );
    } on ApiFailure catch (e) {
      emit(CountrySelectorState.error(e));
    }
  }

  void showCountryList({Country? selectedCountry}) {
    state.whenOrNull(
      close: (country, countries) {
        emit(
          CountrySelectorState.open(
            countries: countries,
            selectedCountry: selectedCountry ?? country,
          ),
        );
      },
    );
  }

  void filterCountryList(String value) {
    state.whenOrNull(
      open: (selectedCountry, countries) {
        emit(
          CountrySelectorState.open(
            countries: cachedCountries
                ?.where(
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

  /// Selects country in [cachedCountries] by [countryName]
  void selectInitialCountry({required String countryName}) {
    try {
      logger.d('Countries: ${cachedCountries.toString()}');

      final selectedInitialCountry = cachedCountries?.firstWhere(
        (element) {
          final isFound = element.name.equalsIgnoreCase(countryName);

          logger.d('isFound COUNTRY: $isFound ; element = ${element.name}');
          return isFound;
        },
      );
      selectCountry(selectedInitialCountry);
    } on ApiFailure catch (e) {
      emit(CountrySelectorState.error(e));
    } catch (e, s) {
      logger.e(e, [s]);
    }
  }

  void selectCountry(Country? country) {
    state.whenOrNull(
      close: (_, countries) {
        if (country != null) {
          countryForm.control(countryField).value =
              ' ${country.emoji}  ${country.name}';
        } else {
          countryForm.control(countryField).value = '';
        }
        emit(
          CountrySelectorState.close(
            selectedCountry: country,
            countries: countries,
          ),
        );
      },
      open: (_, countries) {
        if (country != null) {
          countryForm.control(countryField).value =
              ' ${country.emoji}  ${country.name}';
        } else {
          countryForm.control(countryField).value = '';
        }
        emit(
          CountrySelectorState.close(
            selectedCountry: country,
            countries: countries,
          ),
        );
      },
    );
  }
}
