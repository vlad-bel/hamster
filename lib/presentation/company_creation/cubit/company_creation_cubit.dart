import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/company_creation/cubit/company_creation_state.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/cubit/account_verification_cubit.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class CompanyCreationCubit extends Cubit<CompanyCreationState> {
  CompanyCreationCubit({
    required this.usecase,
    required this.accountVerificationCubit,
  }) : super(const CompanyCreationState.init());

  final CompanyUsecase usecase;
  final AccountVerificationCubit accountVerificationCubit;

  static const companyField = 'company';
  static const addressField = 'address';
  static const postcodeField = 'postcode';
  static const streetField = 'street';
  static const streetNumberField = 'houseNum';
  static const cityField = 'city';

  final formGroup = fb.group({
    companyField: FormControl<String>(
      validators: [
        Validators.minLength(2),
        Validators.maxLength(32),
        Validators.required,
      ],
    ),
    postcodeField: FormControl<String>(
      validators: [
        Validators.minLength(2),
        Validators.maxLength(32),
        Validators.required,
      ],
    ),
    streetField: FormControl<String>(
      validators: [
        Validators.minLength(2),
        Validators.maxLength(120),
        Validators.required,
      ],
    ),
    streetNumberField: FormControl<String>(
      validators: [
        Validators.minLength(1),
        Validators.maxLength(8),
        Validators.required,
      ],
    ),
    cityField: FormControl<String>(
      validators: [
        Validators.minLength(2),
        Validators.maxLength(128),
        Validators.required,
      ],
    ),
  });

  Future createCompany(Country country) async {
    try {
      emit(const CompanyCreationState.loading());
      await Future<void>.delayed(Duration(seconds: 2));
      final response = await usecase.createCompany(
        companyName: formGroup.control(companyField).value as String,
        city: formGroup.control(cityField).value as String,
        streetName: formGroup.control(streetField).value as String,
        streetNumber: formGroup.control(streetNumberField).value as String,
        postalCode: formGroup.control(postcodeField).value as String,
        country: country.name,
        countryCode: country.code!,
      );
      await accountVerificationCubit.getRepCompanyData();
      emit(const CompanyCreationState.success());
    } on ApiFailure catch (e) {
      emit(CompanyCreationState.error(e));
    }
  }
}
