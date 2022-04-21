import 'package:flutter/material.dart';
import 'package:business_terminal/l10n/l10n.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
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
        onPressed: onPressed,
        child:  Text(
          AppLocalizations.of(context).return_button,
          style: TextStyle(color: Color(0xff147bd9)),
        ),
      ),
    );
  }
}
