import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    Key? key,
    this.width = 145,
  }) : super(key: key);

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
        onPressed: () {},
        child: const Text(
          'ZURÜCK',
          style: TextStyle(color: Color(0xff147bd9)),
        ),
      ),
    );
  }
}
