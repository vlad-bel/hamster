import 'package:flutter/material.dart';

class ActionButtonBlue extends StatelessWidget {
  const ActionButtonBlue({
    Key? key,
    this.isEnabled = false,
    this.width,
    required this.onPressed,
  }) : super(key: key);

  final bool isEnabled;
  final VoidCallback onPressed;
  final double? width;

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
              return const TextStyle(color: Color(0x66676f86));
            }
            return const TextStyle(color: Colors.white);
          }),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: const Text('WEITER'),
      ),
    );
  }

  void onPressedRegister(BuildContext context) {}
}
