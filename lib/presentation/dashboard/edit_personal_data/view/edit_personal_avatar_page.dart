import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_cubit.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_state.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPersonalAvatarPage extends StatefulWidget {
  const EditPersonalAvatarPage({Key? key}) : super(key: key);

  @override
  State<EditPersonalAvatarPage> createState() => _EditPersonalAvatarPageState();
}

class _EditPersonalAvatarPageState extends State<EditPersonalAvatarPage> {
  late final CropController _cropController;

  @override
  void initState() {
    super.initState();
    _cropController = CropController();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      showLanguageDropdown: false,
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).editYourProfilePhoto,
          subHeader: Text(
            AppLocale.of(context).selectCorrectAvatarSection,
          ),
        ),
        body: BlocBuilder<EditPersonalDataCubit, EditPersonalDataState>(
            builder: (context, state) {
          return Center(
            child: Column(
              children: [
                const SizedBox(height: 24),
                SizedBox(
                  width: 350,
                  height: 350,
                  child: Crop(
                    controller: _cropController,
                    image: state.avatar!.whenOrNull(
                      file: (file) => file.bytes!,
                    )!,
                    withCircleUi: true,
                    onCropped: (cropped) {
                      context
                          .read<EditPersonalDataCubit>()
                          .onImageCropped(cropped);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: WhiteButton(
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ActionButtonBlue(
                        isEnabled: true,
                        onPressed: _cropController.crop,
                        child: Text(AppLocale.of(context).save),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
