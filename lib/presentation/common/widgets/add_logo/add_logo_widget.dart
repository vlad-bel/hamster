import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/cubit/add_logo_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/widgets/add_logo_round_add_cell.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/widgets/add_logo_round_image_cell.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/widgets/add_logo_selected_widget.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/add_logo_cropper_page.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/dash_bordered_container/dash_bordered_container_widget.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/circle_dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/logo_viewer/logo_viewer.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarPictureSelector extends StatelessWidget {
  const AvatarPictureSelector({
    Key? key,
    required this.showAddButton,
    required this.showEditButton,
    required this.files,
  }) : super(key: key);

  final List<AppColoredFile> files;
  final bool showAddButton;
  final bool showEditButton;

  Future pickAndCropImage(BuildContext context) async {
    final cubit = context.read<AddLogoCubit>();
    final image = await cubit.pickImage(context);
    if (image != null) {
      cubit.loading();
      await Future.delayed(const Duration(milliseconds: 200));

      final croppedImage = await Navigator.pushNamed<AppColoredFile>(
        context,
        AddLogoCropperPage.path,
        arguments: AddLogoCropperArguments(
          header: AppLocale.of(context).edit_company_logo,
          subheader: '',
          imageForCrop: image,
          circleCrop: true,
        ),
      );

      if (croppedImage != null) {
        return cubit.setImage(image: croppedImage);
      }
    }

    return cubit.init();
  }

  List<Widget> _generatePhotoCells(
    BuildContext context,
    List<AppColoredFile>? images,
    AppColoredFile? selectedImage,
  ) {
    final cells = <Widget>[
      if (showAddButton)
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: AddLogoRoundAddCellWidget(
            onPressed: () {
              pickAndCropImage(context);
            },
          ),
        )
    ];

    for (final image in images ?? <AppColoredFile>[]) {
      cells.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AddLogoRoundImageCell(
            isSelected: image == selectedImage,
            file: image,
          ),
        ),
      );
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddLogoCubit>(),
      child: BlocBuilder<AddLogoCubit, AddLogoState>(
        builder: (context, state) {
          final loader = state.when(
            loading: (_, __) => const SizedBox(
              height: 220,
              width: 220,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            init: (_, __) => const SizedBox(),
          );

          if (state.images != null && state.selectedImage != null) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AddLogoSelectedWidget(
                      file: AppColoredFile(
                        name: state.selectedImage?.name,
                        bytes: state.selectedImage?.bytes,
                        color: state.selectedImage?.color,
                        extension: state.selectedImage!.getExtension!,
                      ),
                      showEditButton: showEditButton,
                      onPressed: () {},
                    ),
                    loader,
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  children: _generatePhotoCells(
                    context,
                    [
                      ...files,
                      ...state.images ?? [],
                    ],
                    state.selectedImage,
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WhiteButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ActionButtonBlue(
                      isEnabled: true,
                      onPressed: () {
                        Navigator.pop(
                          context,
                          state.images,
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          }
          return Column(
            children: [
              Stack(
                children: [
                  if (files.isNotEmpty)
                    Column(
                      children: [
                        AppLogoViewer(
                          images: files,
                          onPressed: () async {
                            pickAndCropImage(context);
                          },
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          children: _generatePhotoCells(
                            context,
                            [
                              ...files,
                              ...state.images ?? [],
                            ],
                            state.selectedImage,
                          ),
                        ),
                      ],
                    )
                  else
                    SizedBox(
                      width: 220,
                      height: 220,
                      child: CircleDashedButton(
                        label: AppLocale.of(context).add_logo,
                        onTap: () {
                          pickAndCropImage(context);
                        },
                      ),
                    ),
                  loader,
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WhiteButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const ActionButtonBlue(
                    onPressed: null,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class AppAddLogoWidget extends StatelessWidget {
  const AppAddLogoWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppDashBorderedContainer(
      boxShape: BoxShape.circle,
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            100,
          ),
          onTap: onPressed,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_circle,
                  color: denim1,
                ),
                const SizedBox(width: 4),
                Text(
                  AppLocale.of(context).add_logo,
                  style: inter14.copyWith(
                    color: denim1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
