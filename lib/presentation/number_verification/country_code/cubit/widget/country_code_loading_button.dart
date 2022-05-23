import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';

class CountryCodeLoadingButton extends StatelessWidget {
  const CountryCodeLoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButtonBlue(
      onPressed: () {},
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: SizedBox(
          width: 24,
          height: 32,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
