import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    super.key,
    required this.onPressed,
    this.width = 145,
    this.child,
    this.enabled = true,
  });

  final VoidCallback onPressed;

  final double width;

  final Widget? child;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 37,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          onPrimary: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.5),
            side: const BorderSide(color: Color(0x4d707070)),
          ),
        ),
        onPressed: enabled ? onPressed : null,
        child: child ??
            Text(
              AppLocale.of(context).return_button,
              style: const TextStyle(
                color: denim1,
              ),
            ),
      ),
    );
  }
}
