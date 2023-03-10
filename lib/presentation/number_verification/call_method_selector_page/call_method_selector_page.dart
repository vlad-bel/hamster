import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_form.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallMethodSelectorPage extends StatelessWidget {
  const CallMethodSelectorPage({
    super.key,
    required this.phoneNumber,
    required this.email,
  });

  static const path = '${CountryCodePage.path}/call_method';

  final String phoneNumber;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CallMethodSelectorPageCubit>(
      create: (BuildContext context) {
        return getIt.get<CallMethodSelectorPageCubit>();
      },
      child: CallMethodSelectorForm(
        number: phoneNumber,
        email: email,
      ),
    );
  }
}
