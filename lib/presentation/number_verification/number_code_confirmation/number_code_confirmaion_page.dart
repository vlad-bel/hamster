import 'package:business_terminal/dependency_injection/di.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmation_form.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCodeConfirmationPage extends StatelessWidget {
  const NumberCodeConfirmationPage({
    Key? key,
    required this.phone,
    required this.email,
    required this.verifyMethod,
  }) : super(key: key);

  static const path = '${CallMethodSelectorPage.path}/number_confirm';

  final String phone;
  final String email;
  final VerifyMethod verifyMethod;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NumberCodeConfirmationCubit>(
      create: (BuildContext context) {
        return NumberCodeConfirmationCubit(
          ///TODO make init via injectable
          useCase: NumberVerificationUseCaseImpl(
            repository: RestClient(
              get<Dio>(),
            ),
          ),
        );
      },
      child: NumberCodeConfirmationForm(
        phone: phone,
        email: email,
        verifyMethod: verifyMethod,
      ),
    );
  }
}
