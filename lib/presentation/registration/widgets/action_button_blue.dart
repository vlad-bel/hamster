import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:flutter/material.dart';

class ActionButtonBlue extends StatelessWidget {
  const ActionButtonBlue({
    super.key,
    this.isEnabled = false,
    this.width,
    required this.onPressed,
    this.child,
  });

  final bool isEnabled;
  final VoidCallback? onPressed;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 145,
      height: 37,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.5),
            ),
          ),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return const TextStyle(color: Color(0xff676f86));
            }
            return const TextStyle(color: Colors.white);
          }),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: child ??
            Text(
              AppLocale.of(context).next.toUpperCase(),
            ),
      ),
    );
  }

  void onPressedRegister(BuildContext context) {}
}
