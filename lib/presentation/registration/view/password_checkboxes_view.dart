import 'package:business_terminal/presentation/registration/widgets/check_box_icon.dart';
import 'package:flutter/material.dart';

extension StringValidators on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));

  bool get containsNumbers => contains(RegExp(r'[0-9]'));

  bool get containsSpecialCharacters =>
      contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

class PasswordValidationView extends StatefulWidget {
  const PasswordValidationView({
    this.controllerPassword,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controllerPassword;
  final VoidCallback onPressed;

  @override
  State<PasswordValidationView> createState() => _PasswordValidationViewState();
}

const int minimalPasswordLength = 10;

class _PasswordValidationViewState extends State<PasswordValidationView> {
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
    return SizedBox(
      height: 450,
      width: 310,
      child: Container(
        decoration: boxDecoration,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28),
                    child: TextButton(
                      onPressed: () {
                        print('close pass validation window');
                      },
                      child: const Text(
                        'Hinweis schließen',
                        style: TextStyle(color: Color(0xffe10054)),
                      ),
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
