import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/email_verification/view/email_verification_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_form.dart';
import 'package:business_terminal/presentation/number_verification/country_code/cubit/country_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Page for selecting country via dropdown list
class CountriesCodePage extends StatelessWidget {
  const CountriesCodePage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  static const path = '${EmailVerificationPage.path}/countries_code';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCodeSelectorCubit>(
          create: (context) {
            return getIt.get<CountryCodeSelectorCubit>();
          },
        ),
        BlocProvider<CountryCodeCubit>(
          create: (context) {
            return getIt.get<CountryCodeCubit>()..email = email;
          },
        ),
      ],
      child: const ContryCodeForm(),
    );
  }
}