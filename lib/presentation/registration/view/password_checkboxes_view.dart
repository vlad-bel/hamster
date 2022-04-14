import 'package:business_terminal/presentation/registration/widgets/check_box_icon.dart';
import 'package:flutter/material.dart';

extension StringValidators on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));

  bool get containsNumbers => contains(RegExp(r'[0-9]'));

  bool get containsSpecialCharacters =>
      contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

class PasswordCheckboxes extends StatefulWidget {
  const PasswordCheckboxes({
    this.controllerPassword,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controllerPassword;

  @override
  State<PasswordCheckboxes> createState() => _PasswordCheckboxesState();
}

const int minimalPasswordLength = 10;

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
  bool has1Number = false;

  @override
  void initState() {
    super.initState();
    widget.controllerPassword?.addListener(passValidation);
  }

  void passValidation() {
    final password = widget.controllerPassword?.text ?? '';

    setState(() {
      has10Characters = password.length >= minimalPasswordLength;
      has1LowerCaseLetter = password.containsLowercase;
      has1UpperCaseLetter = password.containsUppercase;
      has1SpecialCharacter = password.containsSpecialCharacters;
      has1Number = password.containsNumbers;
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
        child: Expanded(
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
                  CheckBoxIconGreen(
                    text: '1 Kleinbuchstabe',
                    enabled: has1LowerCaseLetter,
                  ),
                  CheckBoxIconGreen(
                    text: '1 Großbuchstabe',
                    enabled: has1UpperCaseLetter,
                  ),
                  CheckBoxIconGreen(
                    text: '1 Zahl',
                    enabled: has1Number,
                  ),
                  CheckBoxIconGreen(
                    text: '1 Sonderzeichen',
                    enabled: has1SpecialCharacter,
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
      ),
    );
  }
}
