import 'package:business_terminal/presentation/registration/widgets/check_box_icon.dart';
import 'package:flutter/material.dart';

class PasswordCheckboxes extends StatefulWidget {
  const PasswordCheckboxes({
    this.controllerPassword,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controllerPassword;

  @override
  State<PasswordCheckboxes> createState() => _PasswordCheckboxesState();
}

class _PasswordCheckboxesState extends State<PasswordCheckboxes> {
  BoxDecoration get boxDecoration => const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      );

  bool has10Characters = false;
  bool has1LowerCaseLetter = false;
  bool has1UpperCaseLetter = false;
  bool has1SpecialCharacter = false;

  @override
  void initState() {
    super.initState();
    widget.controllerPassword?.addListener(passValidation);
  }

  void passValidation() {
    final password = widget.controllerPassword?.text ?? '';
    print(password);

    setState(() {
      has10Characters = password.length >= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 310,
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              child: Icon(
                Icons.error_outline_rounded,
                color: Color(0xffe10054),
                size: 80,
              ),
            ),
            Container(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dein Passwort muss mindestens die \nnachfolgenden Kriterien erfüllen:',
                ),
                Container(height: 20),
                CheckBoxIconGreen(
                  text: '10 Zeichen lang',
                  enabled: has10Characters,
                ),
                const CheckBoxIconGreen(
                  text: '1 Kleinbuchstabe',
                  enabled: false,
                ),
                const CheckBoxIconGreen(
                  text: '1 Großbuchstabe',
                  enabled: false,
                ),
                const CheckBoxIconGreen(
                  text: '1 Zahl',
                  enabled: false,
                ),
                const CheckBoxIconGreen(
                  text: '1 Sonderzeichen',
                  enabled: false,
                ),
                Container(height: 24),
              ],
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 28),
                  child: Text(
                    'Hinweis schließen',
                    style: TextStyle(color: Color(0xffe10054)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
