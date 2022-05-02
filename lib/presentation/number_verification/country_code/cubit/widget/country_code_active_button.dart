import 'package:business_terminal/presentation/number_verification/country_code/cubit/country_code_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CountryCodeActiveButton extends StatelessWidget {
  const CountryCodeActiveButton({
    Key? key,
    required this.cubit,
    required this.formGroup,
  }) : super(key: key);

  final CountryCodeCubit cubit;
  final FormGroup formGroup;

  @override
  Widget build(BuildContext context) {
    return ActionButtonBlue(
      width: double.infinity,
      onPressed: cubit.createPhone,
      isEnabled: formGroup.valid,
    );
  }
}
