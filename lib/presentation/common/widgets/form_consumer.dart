import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Possible to use in other cases
/// Consume, validate and submit form
class FormConsumer extends StatelessWidget {
  const FormConsumer({Key? key, required this.onTap, this.onBack})
      : super(key: key);

  final Function(FormGroup) onTap;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WhiteButton(
          onPressed: onBack ?? Navigator.of(context).pop,
        ),
        const Spacer(),
        SizedBox(
          height: 37,
          width: 145,
          child: ReactiveFormConsumer(
            builder: (context, formGroup, child) {
              return ActionButtonBlue(
                isEnabled: formGroup.valid,
                width: double.infinity,
                onPressed: () => onTap(formGroup),
              );
            },
          ),
        ),
      ],
    );
  }
}
