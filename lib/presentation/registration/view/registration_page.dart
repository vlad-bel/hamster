// TODO: remove when code is finalized
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/hint/hint_overlay_provider_mixin.dart';
import 'package:business_terminal/presentation/common/widgets/hint/password_hint_view.dart';
import 'package:business_terminal/presentation/common/widgets/horizontal_line_short_grey.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/language_dropdown.dart';
import 'package:business_terminal/presentation/common/widgets/text_title.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:business_terminal/presentation/otp_verification/view/otp_verification_page.dart';
import 'package:business_terminal/presentation/registration/cubit/user_info_init_cubit.dart';
import 'package:business_terminal/presentation/registration/form_validation_rules/user_info_form_group.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  static const path = '/registration';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserInfoInitCubit>(),
      child: const RegistrationView(),
    );
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RegistrationBodyView()),
    );
  }
}

class RegistrationBodyView extends StatefulWidget {
  const RegistrationBodyView({super.key});

  @override
  State<RegistrationBodyView> createState() => _RegistrationBodyViewState();
}

class _RegistrationBodyViewState extends State<RegistrationBodyView> {
  late final TextEditingController _controllerPassword;
  late final TextEditingController _controllerPasswordConfirmation;
  final FocusNode _focusListenerPassword = FocusNode();
  final FocusNode _focusListenerPasswordConfirmation = FocusNode();

  final formSettings = FormSettingsRegistrationUserInfo();

  var _passwordValidationVisible = true;

  @override
  void initState() {
    _controllerPassword = TextEditingController();
    _controllerPasswordConfirmation = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subtitleText = Text(
      'Registrieren Sie sich jetzt, um'
      ' Teil des deutschlandweiten Netzwerks zu werden.',
    );

    return Stack(
      children: [
        Image.asset(
          Assets.imagesBackgroundImageSignUp,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            width: 120,
            height: 45,
            child: SvgPicture.asset(
              Assets.imagesHamsterLogo,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(33),
            child: LanguageDropdown(),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              child: SizedBox(
                width: 390,
                child: ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(
                          title: 'Nutzen Sie Hamster für Ihr \nUnternehmen.',
                        ),
                        Container(height: 18),
                        HorizontalLineShortGrey(),
                        Container(height: 18),
                        subtitleText,
                        Container(height: 25),
                        ReactiveFormBuilder(
                          form: formSettings.buildForm,
                          builder: (context, form, child) {
                            return Column(
                              children: [
                                FormTextField(
                                  name: formSettings.kFieldName,
                                  label: 'Vorname eingeben',
                                  validationMessages: (control) =>
                                      formSettings.validationMessageNameSurname,
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldSurname,
                                  label: 'Nachname eingeben',
                                  validationMessages: (control) =>
                                      formSettings.validationMessageNameSurname,
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldEmail,
                                  label: 'E-Mail',
                                  validationMessages: (control) =>
                                      formSettings.validationMessageEmail,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldPassword,
                                  label: 'Passwort wählen',
                                  validationMessages: (control) =>
                                      formSettings.validationMessagePassword,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  controller: _controllerPassword,
                                  focusListener: _focusListenerPassword,
                                  hintOverlayBuilder: _getPasswordHintOverlay(
                                    controller: _controllerPassword,
                                    focusNode: _focusListenerPassword,
                                  ),
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldPasswordConfirmation,
                                  label: 'Passwort wiederholen',
                                  validationMessages: (control) =>
                                      formSettings.validationMessagePassword,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                  controller: _controllerPasswordConfirmation,
                                  focusListener:
                                      _focusListenerPasswordConfirmation,
                                  hintOverlayBuilder: _getPasswordHintOverlay(
                                    controller: _controllerPasswordConfirmation,
                                    focusNode:
                                        _focusListenerPasswordConfirmation,
                                  ),
                                ),
                                Container(height: 28),

                                /// Bottom action buttons:
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WhiteButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ReactiveFormConsumer(
                                      builder: (context, formGroup, child) {
                                        return BlocListener<UserInfoInitCubit,
                                            UserInfoInitState>(
                                          listener: (
                                            context,
                                            UserInfoInitState state,
                                          ) {
                                            if (state is LoadingUserInfoInit) {
                                              context.loaderOverlay.show();
                                            } else {
                                              context.loaderOverlay.hide();
                                            }

                                            if (state is ErrorUserInfoInit) {
                                              showErrorSnackbar();
                                            }
                                            if (state is SuccessUserInfoInit) {
                                              goToNextPage(context, form);
                                            }
                                          },
                                          child: ActionButtonBlue(
                                            isEnabled: formGroup.valid,
                                            onPressed: () {
                                              onPressedRegister(
                                                context,
                                                formGroup,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  HintOverlayWidgetBuilder? _getPasswordHintOverlay({
    TextEditingController? controller,
    required FocusNode focusNode,
  }) {
    if (!_passwordValidationVisible) return null;
    return (_) => PasswordHintView(
          onPressed: _onPressedClosePasswordValidation,
          focusNodePassword: focusNode,
          controllerPassword: controller,
        );
  }

  void onPressedRegister(BuildContext context, FormGroup form) {
    final name = form.value[formSettings.kFieldName] as String?;
    final surname = form.value[formSettings.kFieldSurname] as String?;
    final email = form.value[formSettings.kFieldEmail] as String?;
    final password = form.value[formSettings.kFieldPassword] as String?;

    context.read<UserInfoInitCubit>().iniUserInfoCreation(
          name,
          surname,
          email,
          password,
        );
  }

  void goToNextPage(BuildContext context, FormGroup form) {
    final email = form.value[formSettings.kFieldEmail] as String?;

    Navigator.of(context).pushNamed(
      EmailVerificationPage.path,
      arguments: {
        emailParam: email!,
      },
    );
  }

  void _onPressedClosePasswordValidation() {
    setState(() {
      _passwordValidationVisible = false;
    });
  }

  void showErrorSnackbar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    context.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[300],
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            SizedBox(width: 6),
            Text('An error has occurred')
          ],
        ),
      ),
    );
  }
}
