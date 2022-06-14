import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

class AccountVerificationTitleSubtitle extends StatelessWidget {
  const AccountVerificationTitleSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocale.of(context).we_lack_info,
          style: inter20,
        ),
        const SizedBox(height: 30),
        Text(
          AppLocale.of(context).we_lack_info_subtitle,
          style: inter14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
