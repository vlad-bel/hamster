import 'package:business_terminal/presentation/number_verification/country_code/country_code_form.dart';
import 'package:flutter/material.dart';

///Page for selecting country via dropdown list
class CountriesCodePage extends StatelessWidget {
  const CountriesCodePage({Key? key}) : super(key: key);

  static const path = 'country_code';

  @override
  Widget build(BuildContext context) {
    return const ContryCodeForm();
  }
}
