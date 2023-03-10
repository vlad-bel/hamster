import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_page.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/widget/branch_profile_avatar_picture_selector.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileAvatarPictureForm extends StatefulWidget {
  const BranchProfileAvatarPictureForm({
    Key? key,
    required this.showAddButton,
    required this.showEditButton,
  }) : super(key: key);

  final bool showAddButton;
  final bool showEditButton;

  @override
  State<BranchProfileAvatarPictureForm> createState() =>
      _BranchProfileAvatarPictureFormState();
}

class _BranchProfileAvatarPictureFormState
    extends State<BranchProfileAvatarPictureForm> {
  void saveImagesToBranchProfile(BuildContext context) {
    final branchProfilePageCubit = context.read<BranchProfileCubit>();
    final branchProfilePictureCubit = context.read<BranchProfilePictureCubit>();
    final branchProfileAvatarCubit =
        context.read<BranchProfileAvatarPictureCubit>();

    final newBranchImages = <AppColoredFile>[];

    if (branchProfilePictureCubit.state.selectedImage != null) {
      newBranchImages.add(branchProfilePictureCubit.state.selectedImage!);
    }

    if (branchProfilePictureCubit.state.images != null) {
      final filteredBranchImages =
          List.of(branchProfilePictureCubit.state.images!)
            ..removeWhere(
              (element) =>
                  element == branchProfilePictureCubit.state.selectedImage,
            );

      newBranchImages.addAll(
        filteredBranchImages,
      );
    }

    final newAvatarImages = <AppColoredFile>[];
    if (branchProfileAvatarCubit.state.selectedImage != null) {
      newAvatarImages.add(branchProfileAvatarCubit.state.selectedImage!);
    }

    if (branchProfileAvatarCubit.state.images != null) {
      final filteredAvatarImages = List.of(
        branchProfileAvatarCubit.state.images!,
      )..removeWhere(
          (element) => element == branchProfileAvatarCubit.state.selectedImage,
        );

      newAvatarImages.addAll(
        filteredAvatarImages,
      );
    }

    branchProfilePageCubit.setImages(
      branchImages: newBranchImages,
      avatarImages: newAvatarImages,
    );

    Navigator.popUntil(
      context,
      (route) => route.settings.name == BranchProfilePage.path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.current.add_picture_for_branch,
          subHeader: Text(
            AppLocale.current.add_picture_for_branch_descr,
            style: inter14,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 26),
            BranchProfileAvatarPictureSelector(
              showAddButton: widget.showAddButton,
              showEditButton: widget.showEditButton,
            ),
            const SizedBox(height: 38),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WhiteButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: 162,
                  child: Text(
                    AppLocale.current.return_button,
                    style: inter14.copyWith(color: denim),
                  ),
                ),
                const SizedBox(width: 25),
                BlocBuilder<BranchProfileAvatarPictureCubit,
                    BranchProfileAvatarPictureState>(
                  builder: (context, state) {
                    return ActionButtonBlue(
                      onPressed: () {
                        saveImagesToBranchProfile(context);
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
