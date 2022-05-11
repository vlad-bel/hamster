import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

class AccountVerificationTitleSubtitle extends StatelessWidget {
  const AccountVerificationTitleSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ein paar Informationen fehlen uns noch',
          style: inter20,
        ),
        const SizedBox(height: 30),
        Text(
          'Die drei nachfolgenden Bedingungen müssen erfüllt sein bevor Sie die Verifikation Ihres Unternehmens mit den'
          '\ndazugehörigen Filialen beantragen können, um in der HamsterApp aufgeführt zu werden.',
          style: inter14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
