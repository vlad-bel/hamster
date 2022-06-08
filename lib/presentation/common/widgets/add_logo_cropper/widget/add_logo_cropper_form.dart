import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/image/image_paths.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/cubit/add_logo_cropper_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/cubit/add_logo_cropper_state.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form_state.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddLogoCropperForm extends StatefulWidget {
  const AddLogoCropperForm({
    Key? key,
    required this.header,
    required this.subheader,
    required this.imageForCrop,
    required this.circleCrop,
  }) : super(key: key);

  final bool circleCrop;
  final String header;
  final AppFile imageForCrop;
  final String subheader;

  @override
  State<AddLogoCropperForm> createState() => _AddLogoCropperFormState();
}

@immutable
class AppColoredFile extends AppFile {
  const AppColoredFile({
    required this.color,
    required super.bytes,
    required super.name,
    required super.extension,
    super.size,
  });

  final String? color;
}

class _AddLogoCropperFormState extends State<AddLogoCropperForm> {
  final _controller = CropController();

  List<Widget> _generatePhotoCells(
    List<String> colors,
    String? selectedColor,
    BuildContext context,
  ) {
    final cells = <Widget>[];

    for (final color in colors) {
      cells.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: InkWell(
            onTap: () {
              context.read<AddLogoCropperFormCubit>().changeBackground(
                    color: color,
                  );
            },
            child: ClipOval(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ColoredBox(
                      color: Color(
                        int.parse(
                          '0xFF$color',
                        ),
                      ),
                    ),
                  ),
                  if (color == selectedColor)
                    Material(
                      color: Colors.transparent,
                      child: Ink(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: valencia),
                          color: valencia.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.imagesCheckMark,
                            color: razzmatazz,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: BlocBuilder<AddLogoCropperCubit, AddLogoCropperState>(
        builder: (context, state) {
          final cubit = context.read<AddLogoCropperCubit>();
          return BlocProvider<AddLogoCropperFormCubit>(
            create: (context) => getIt.get<AddLogoCropperFormCubit>(),
            child:
                BlocBuilder<AddLogoCropperFormCubit, AddLogoCropperFormState>(
              builder: (formContext, formState) {
                return OnboardingBackground(
                  children: Column(
                    children: [
                      OnboardingWhiteContainer(
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
                                  child: Stack(
                                    children: [
                                      Crop(
                                        baseColor: formState.maybeWhen(
                                          success: (
                                            palette,
                                            color,
                                          ) {
                                            return Color(
                                              int.parse(
                                                '0xFF$color',
                                              ),
                                            );
                                          },
                                          orElse: () => white,
                                        ),
                                        controller: _controller,
                                        image: widget.imageForCrop.bytes!,
                                        withCircleUi: widget.circleCrop,
                                        onCropped: (cropped) async {
                                          await Future.delayed(
                                            const Duration(milliseconds: 50),
                                          );
                                          formState.maybeWhen(
                                            success: (
                                              palette,
                                              color,
                                            ) {
                                              Navigator.pop(
                                                context,
                                                AppColoredFile(
                                                  bytes: cropped,
                                                  color: color,
                                                  name: null,
                                                  extension: 'png',
                                                ),
                                              );
                                            },
                                            orElse: () {
                                              Navigator.pop(
                                                context,
                                                AppColoredFile(
                                                  bytes: cropped,
                                                  color: null,
                                                  name: null,
                                                  extension: 'png',
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Transform.translate(
                                        offset: const Offset(8, -12),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: EditButton(
                                            icon: Icons.remove,
                                            onEditTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                state.whenOrNull(
                                      loading: () {
                                        return const SizedBox(
                                          height: 350,
                                          child: Center(
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
                                    await Future.delayed(
                                      const Duration(milliseconds: 50),
                                    );
                                    _controller.crop();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      PortalTarget(
                        visible: formState.maybeMap(
                          hide: (state) {
                            return false;
                          },
                          orElse: () {
                            return true;
                          },
                        ),
                        portalFollower: Transform.translate(
                          offset: const Offset(1150, -100),
                          child: Stack(
                            children: [
                              Container(
                                width: 350,
                                height: 350,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final newColor =
                                              await showColorPickerDialog(
                                            context,
                                            Colors.red,
                                            title: Text(
                                              AppLocale.of(context).palette,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            spacing: 0,
                                            runSpacing: 0,
                                            borderRadius: 0,
                                            wheelDiameter: 165,
                                            showColorCode: true,
                                            colorCodeHasColor: true,
                                            pickersEnabled: <ColorPickerType,
                                                bool>{
                                              ColorPickerType.wheel: true,
                                              ColorPickerType.accent: false,
                                              ColorPickerType.primary: false,
                                            },
                                            constraints: const BoxConstraints(
                                              minHeight: 480,
                                              minWidth: 320,
                                              maxWidth: 320,
                                            ),
                                          );

                                          formContext
                                              .read<AddLogoCropperFormCubit>()
                                              .addColorToPalette(
                                                color: newColor.hex,
                                              );
                                        },
                                        child: SvgPicture.asset(
                                          ImagePaths.icon(
                                            SvgPaths.palette,
                                          ),
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      const SizedBox(height: 22),
                                      Text(
                                        AppLocale.of(context)
                                            .choose_background_color,
                                        style: inter16,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 16),
                                      BlocBuilder<AddLogoCropperFormCubit,
                                          AddLogoCropperFormState>(
                                        builder: (_, state) {
                                          return state.when(
                                            loading: (text) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            },
                                            init: (text) {
                                              return const SizedBox.shrink();
                                            },
                                            success: (palette, selectedColor) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: _generatePhotoCells(
                                                  palette,
                                                  selectedColor,
                                                  _,
                                                ),
                                              );
                                            },
                                            hide: (text) {
                                              return const SizedBox.shrink();
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      TextButton(
                                        onPressed: () {
                                          formContext
                                              .read<AddLogoCropperFormCubit>()
                                              .hide();
                                        },
                                        child: Text(
                                          AppLocale.of(context).close,
                                          style: inter14.copyWith(
                                            color: denim1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(-45, -300),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_left,
                                    color: Colors.white,
                                    size: 80,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        anchor: Aligned.center,
                        child: const SizedBox.shrink(),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
