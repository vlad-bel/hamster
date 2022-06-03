import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/add_logo_widget.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/view/profile_edit.dart';
import 'package:flutter/material.dart';

class ProfileAddLogoArguments {
  ProfileAddLogoArguments({
    required this.files,
  });

  final List<AddedProfileLogoModel> files;
}

class ProfileAddLogoPage extends StatefulWidget {
  const ProfileAddLogoPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  static const String path = myCompanyEditAddLogoPath;

  final ProfileAddLogoArguments arguments;

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
              const SizedBox(height: 24),
              AvatarPictureSelector(
                showAddButton: true,
                files: widget.arguments.files,
                showEditButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
