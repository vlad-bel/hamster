import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmation_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCodeConfirmationPage extends StatelessWidget {
  const NumberCodeConfirmationPage({
    super.key,
    required this.phone,
    required this.email,
    required this.verificationMethod,
  });

  static const path = '${CallMethodSelectorPage.path}/number_confirm';

  final String phone;
  final String email;
  final VerifyMethod verificationMethod;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NumberCodeConfirmationCubit>(
      create: (BuildContext context) {
        return getIt<NumberCodeConfirmationCubit>();
      },
      child: NumberCodeConfirmationForm(
        phone: phone,
        email: email,
        verifyMethod: verificationMethod,
      ),
    );
  }
}
