import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

class CheckboxesListDivider extends StatelessWidget {
  const CheckboxesListDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        border: Border.all(color: lynch.withOpacity(0.1)),
      ),
    );
  }
}
