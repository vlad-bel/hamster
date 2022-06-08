import 'dart:typed_data';

import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/common/cropper_page/cubit/cropper_cubit.dart';
import 'package:business_terminal/presentation/common/cropper_page/cubit/cropper_state.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CropperForm extends StatefulWidget {
  const CropperForm({
    Key? key,
    required this.header,
    required this.subheader,
    required this.imageForCrop,
    required this.circleCrop,
  }) : super(key: key);

  final bool circleCrop;
  final String header;
  final Uint8List imageForCrop;
  final String subheader;

  @override
  State<CropperForm> createState() => _CropperFormState();
}

class _CropperFormState extends State<CropperForm> {
  final _controller = CropController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CropperCubit, CropperState>(
      builder: (context, state) {
        final cubit = context.read<CropperCubit>();
        return OnboardingBackground(
          children: OnboardingWhiteContainer(
            header: OnboardingWhiteContainerHeader(
              header: widget.header,
              subHeader: Text(
                widget.subheader,
                style: inter14,
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 32),
                Stack(
                  children: [
                    SizedBox(
                      height: 350,
                      width: 350,
                      child: Crop(
                        controller: _controller,
                        image: widget.imageForCrop,
                        withCircleUi: widget.circleCrop,
                        onCropped: (cropped) async {
                          await Future.delayed(
                            const Duration(milliseconds: 200),
                          );
                          Navigator.pop(
                            context,
                            AppFile(
                              bytes: cropped,
                              name: null,
                              extension: 'png',
                            ),
                          );
                        },
                      ),
                    ),
                    state.whenOrNull(
                          loading: () {
                            return const SizedBox(
                              height: 350,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ) ??
                        const SizedBox(),
                  ],
                ),
                const SizedBox(height: 62),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WhiteButton(
                      width: 162,
                      enabled: state.maybeWhen(
                        loading: () => false,
                        init: () => true,
                        orElse: () => false,
                      ),
                      child: Text(
                        AppLocale.current.return_button,
                        style: inter14.copyWith(
                          color: denim,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 26),
                    ActionButtonBlue(
                      isEnabled: state.maybeWhen(
                        loading: () => false,
                        init: () => true,
                        orElse: () => false,
                      ),
                      width: 162,
                      child: Text(
                        AppLocale.current.to_save,
                        style: inter14.copyWith(
                          color: white,
                        ),
                      ),
                      onPressed: () async {
                        cubit.loading();
                        await Future.delayed(const Duration(milliseconds: 200));
                        _controller.crop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
