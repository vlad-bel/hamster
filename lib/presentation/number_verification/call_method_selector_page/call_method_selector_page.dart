import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallMethodSelectorPage extends StatelessWidget {
  const CallMethodSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CallMethodSelectorPageCubit>(
      create: (BuildContext context) {
        return CallMethodSelectorPageCubit();
      },
      child: const CallMethodSelectorForm(
        number: '+4912345678910',
      ),
    );
  }
}
