import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/add_logo_widget.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:flutter/material.dart';

class ProfileAddLogoPage extends StatefulWidget {
  const ProfileAddLogoPage({
    Key? key,
  }) : super(key: key);

  static const String path = myCompanyEditAddLogoPath;

  @override
  State<ProfileAddLogoPage> createState() => _ProfileAddLogoPageState();
}

class _ProfileAddLogoPageState extends State<ProfileAddLogoPage> {
  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).addYourCompanyLogo,
          subHeader: Text(AppLocale.of(context).addYourCompanyLogoDescription),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 24),
              AvatarPictureSelector(
                showAddButton: true,
                showEditButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
