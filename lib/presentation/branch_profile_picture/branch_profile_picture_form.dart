import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/branch_profile_avatar_picture_page.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:business_terminal/presentation/branch_profile_picture/widget/branch_profile_picture_selector.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfilePictureForm extends StatelessWidget {
  const BranchProfilePictureForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).add_picture_for_branch,
          subHeader: Text(
            AppLocale.of(context).add_picture_for_branch_descr,
            style: inter14,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 26),
            BranchProfilePictureSelector(),
            SizedBox(height: 38),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WhiteButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: 162,
                  child: Text(
                    AppLocale.of(context).return_button,
                    style: inter14.copyWith(color: denim),
                  ),
                ),
                SizedBox(width: 25),
                BlocBuilder<BranchProfilePictureCubit,
                    BranchProfilePictureState>(
                  builder: (context, state) {
                    return ActionButtonBlue(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          BranchProfileAvatarPicturePage.path,
                        );
                      },
                      isEnabled: state.selectedImage != null,
                      width: 162,
                      child: Text(
                        AppLocale.of(context).continue_button,
                        style: inter14.copyWith(color: white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
