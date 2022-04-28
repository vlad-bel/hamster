import 'package:business_terminal/dependency_injection/di.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_form.dart';
import 'package:business_terminal/presentation/number_verification/country_code/cubit/country_code_cubit.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Page for selecting country via dropdown list
class CountriesCodePage extends StatelessWidget {
  const CountriesCodePage({Key? key}) : super(key: key);

  static const path = '/';

  ///TODO make dependencies via injectable
  static final usecase = NumberVerificationUseCaseImpl(
    repository: RestClient(
      get<Dio>(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ///TODO make dependencies via injectable
        BlocProvider<CountryCodeSelectorCubit>(
          create: (context) {
            return CountryCodeSelectorCubit(
              useCase: usecase,
            );
          },
        ),
        BlocProvider<CountryCodeCubit>(
          create: (context) {
            ///TODO make dependencies via injectable
            return CountryCodeCubit(
              useCase: usecase,
              codeSelectorCubit: BlocProvider.of<CountryCodeSelectorCubit>(
                context,
              ),
            );
          },
        ),
      ],
      child: const ContryCodeForm(),
    );
  }
}
