import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code_cubit.freezed.dart';

class CountryCodeCubit extends Cubit<CountryCodeState> {
  CountryCodeCubit({
    required this.useCase,
    required this.codeSelectorCubit,
  }) : super(
          const CountryCodeState.success(),
        );

  final NumberVerificationUseCase useCase;
  final CountryCodeSelectorCubit codeSelectorCubit;

  Future createPhone(// required Function(String, String) emailCreated,
      ) async {
    await codeSelectorCubit.state.whenOrNull(
      success: (selectedCountry, countries) async {
        final phoneNumber = codeSelectorCubit
            .numberForm
            .controls[CountryCodeSelectorCubit.numberTextfield]!
            .value! as String;

        final phoneNumberWithCode = '${selectedCountry!.phone}$phoneNumber';

        const testEmail = 'john.doe@test.com';
        try {
          emit(const CountryCodeState.loading());
          // await Future<void>.delayed(Duration(seconds: 2));
          await useCase.createPhone(
            email: testEmail,
            phone: phoneNumberWithCode,
          );
          emit(
            CountryCodeState.next(
              email: testEmail,
              phone: phoneNumberWithCode,
            ),
          );
          // emailCreated(testEmail, phoneNumberWithCode);
        } on ApiFailure catch (e) {
          emit(CountryCodeState.error(e));
        }
      },
    );
  }
}

@freezed
class CountryCodeState with _$CountryCodeState {
  const factory CountryCodeState.loading() = LoadingCountryCodeState;

  const factory CountryCodeState.success() = SucessCountryCodeState;

  const factory CountryCodeState.next({
    required String email,
    required String phone,
  }) = NextCountryCodeState;

  const factory CountryCodeState.error(ApiFailure e) = ErrorCountryCodeState;
}
