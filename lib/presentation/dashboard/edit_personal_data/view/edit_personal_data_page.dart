import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:flutter/material.dart';

class EditPersonalDataPage extends StatefulWidget {
  static const path = 'edit_personal_data';

  const EditPersonalDataPage({Key? key}) : super(key: key);

  @override
  State<EditPersonalDataPage> createState() => _EditPersonalDataPageState();
}

class _EditPersonalDataPageState extends State<EditPersonalDataPage> {
  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      showLanguageDropdown: false,
      children: Container(),
    );
  }
}
