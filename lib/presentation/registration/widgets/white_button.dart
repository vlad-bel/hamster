import 'package:business_terminal/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    Key? key,
    required this.onPressed,
    this.width = 145,
  }) : super(key: key);

  final VoidCallback onPressed;

  final double width;

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
        onPressed: onPressed,
        child:  Text(
          context.l10n.return_button,
          style: TextStyle(color: Color(0xff147bd9)),
        ),
      ),
    );
  }
}
