import 'package:business_terminal/presentation/countries_list/country_list_form.dart';
import 'package:flutter/material.dart';

///Page for selecting country via dropdown list
class CountriesListPage extends StatelessWidget {
  const CountriesListPage({Key? key}) : super(key: key);

  static const path = 'country_list';

  @override
  Widget build(BuildContext context) {
    return  ContryListForm();
  }
}
