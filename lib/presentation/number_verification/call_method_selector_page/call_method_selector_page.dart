import 'package:business_terminal/dependency_injection/di.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_form.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallMethodSelectorPage extends StatelessWidget {
  const CallMethodSelectorPage({
    Key? key,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  static const path = '/call_method';

  final String phoneNumber;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CallMethodSelectorPageCubit>(
      create: (BuildContext context) {
        return CallMethodSelectorPageCubit(
          ///TODO make dependency via injectable
          useCase: NumberVerificationUseCaseImpl(
            repository: RestClient(
              get<Dio>(),
            ),
          ),
        );
      },
      child: CallMethodSelectorForm(
        number: phoneNumber,
        email: email,
      ),
    );
  }
}
