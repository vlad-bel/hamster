import 'package:business_terminal/presentation/call_method_selector/call_method_selector_form.dart';
import 'package:flutter/material.dart';

class CallMethodSelectorPage extends StatelessWidget {
  const CallMethodSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CallMethodSelectorForm(
      number: '+4912345678910',
    );
  }
}
