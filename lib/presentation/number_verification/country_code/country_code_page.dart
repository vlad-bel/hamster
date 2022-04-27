import 'package:business_terminal/data/gateway/rest_client.dart';
import 'package:business_terminal/domain/dependency_injection/di.dart';
import 'package:business_terminal/domain/use_cases/number_verification/number_verification_use_case_impl.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Page for selecting country via dropdown list
class CountriesCodePage extends StatelessWidget {
  const CountriesCodePage({Key? key}) : super(key: key);

  static const path = 'country_code';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryCodeSelectorCubit>(
      create: (context) {
        ///TODO make dependencies via injectable
        return CountryCodeSelectorCubit(
          useCase: NumberVerificationUseCaseImpl(
            repository: RestClient(
              get<Dio>(),
            ),
          ),
        );
      },
      child: const ContryCodeForm(),
    );
  }
}
