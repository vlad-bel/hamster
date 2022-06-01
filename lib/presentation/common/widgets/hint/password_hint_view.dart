import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/app/utils/validation_utils.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/config/validation_constants.dart';
import 'package:business_terminal/presentation/common/widgets/hint/password_hint_background.dart';
import 'package:business_terminal/presentation/registration/widgets/check_box_icon.dart';
import 'package:flutter/material.dart';

class PasswordHintView extends StatefulWidget implements PreferredSizeWidget {
  static const _kDefaultWidth = 310.0;
  static const _kDefaultHeight = 450.0;
  static const _kDefaultStartMargin = 58.0;

  const PasswordHintView({
    this.controllerPassword,
    required this.onPressed,
    required this.focusNodePassword,
    super.key,
  });

  final TextEditingController? controllerPassword;
  final VoidCallback onPressed;
  final FocusNode focusNodePassword;

  @override
  State<PasswordHintView> createState() => _PasswordHintViewState();

  @override
  Size get preferredSize =>
      Size(_kDefaultWidth + _kDefaultStartMargin, _kDefaultHeight);
}

class _PasswordHintViewState extends State<PasswordHintView> {
  bool has10Characters = false;
  bool has1LowerCaseLetter = false;
  bool has1UpperCaseLetter = false;
  bool has1SpecialCharacter = false;
  bool has1Number = false;

  @override
  void initState() {
    super.initState();
    passValidation();
    widget.controllerPassword?.addListener(passValidation);
    widget.focusNodePassword.addListener(passValidation);
  }

  void passValidation() {
    final password = widget.controllerPassword?.text ?? '';

    setState(() {
      has10Characters =
          password.length >= ValidationConstants.kMinimalPasswordLength;
      has1LowerCaseLetter = password.containsLowercase;
      has1UpperCaseLetter = password.containsUppercase;
      has1SpecialCharacter = password.containsSpecialCharacters;
      has1Number = password.containsNumbers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: PasswordHintView._kDefaultStartMargin),
      child: PasswordHintBackground(
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
              Text(
                AppLocale.of(context).passwordHintTitle,
              ),
              Container(height: 20),
              CheckBoxIconGreen(
                text: AppLocale.of(context).hasTenCharacters,
                enabled: has10Characters,
              ),
              CheckBoxIconGreen(
                text: AppLocale.of(context).hasOneLoweCaseLetter,
                enabled: has1LowerCaseLetter,
              ),
              CheckBoxIconGreen(
                text: AppLocale.of(context).hasOneUpperCaseLetter,
                enabled: has1UpperCaseLetter,
              ),
              CheckBoxIconGreen(
                text: AppLocale.of(context).hasOneSpecialCharacter,
                enabled: has1Number,
              ),
              CheckBoxIconGreen(
                text: AppLocale.of(context).hasOneSpecialCharacter,
                enabled: has1SpecialCharacter,
              ),
              SizedBox(height: 24),
              Align(
                child: TextButton(
                  onPressed: widget.onPressed,
                  child: Text(
                    AppLocale.of(context).closeHint,
                    style: inter14.copyWith(color: razzmatazz),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
