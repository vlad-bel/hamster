import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_form.dart';
import 'package:business_terminal/presentation/number_verification/country_code/cubit/country_code_cubit.dart';
import 'package:business_terminal/presentation/otp_verification/view/otp_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Page for selecting country via dropdown list
class CountryCodePage extends StatelessWidget {
  const CountryCodePage({
    super.key,
    required this.email,
  });

  final String email;

  static const path = '${EmailVerificationPage.path}/countries_code';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCodeCubit>(
          create: (context) {
            return getIt.get<CountryCodeCubit>()..email ??= email;
          },
        ),
      ],
      child: const CountryCodeForm(),
    );
  }
}
