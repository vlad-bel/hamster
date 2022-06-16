import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/hint/password_hint_background.dart';
import 'package:flutter/material.dart';

/// Floating hint when current password incorrect
/// Using example - [https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/d6698e94-9275-4ed6-b9fb-944a36f684c2/]
class CurrentPasswordIncorrectHint extends StatelessWidget
    implements PreferredSizeWidget {
  static const _kDefaultWidth = 360.0;
  static const _kDefaultHeight = 380.0;
  static const _kDefaultStartMargin = 58.0;

  final VoidCallback onPressed;

  const CurrentPasswordIncorrectHint({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: _kDefaultStartMargin),
      child: PasswordHintBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              const Icon(
                Icons.error_outline_rounded,
                color: Color(0xffe10054),
                size: 80,
              ),
              const SizedBox(height: 24),
              Text(
                AppLocale.current.wrongPassword,
                style: inter24,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                AppLocale.current.passwordIncorrectDescription,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Align(
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    AppLocale.current.closeHint,
                    style: const TextStyle(color: Color(0xffe10054)),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size(_kDefaultWidth + _kDefaultStartMargin, _kDefaultHeight);
}
