import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordChangedWidget extends StatelessWidget {
  const PasswordChangedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: const BoxConstraints(maxWidth: 450),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.imagesKeyThin,
            height: 80,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(height: 24),
          Text(
            AppLocale.current.passwordChanged,
            style: inter24,
          ),
          const SizedBox(height: 24),
          Text(
            AppLocale.current.passwordChangedDescription,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ActionButtonBlue(
            isEnabled: true,
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
