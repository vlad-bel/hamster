// TODO: remove when code is finalized
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/registration/cubit/registration_cubit.dart';
import 'package:business_terminal/presentation/registration/form_validation_rules/user_info_form_group.dart';
import 'package:business_terminal/presentation/registration/view/password_checkboxes_view.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationCubit(),
      child: const RegistrationView(),
    );
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RegistrationBodyView()),
    );
  }
}

class RegistrationBodyView extends StatefulWidget {
  const RegistrationBodyView({Key? key}) : super(key: key);

  @override
  State<RegistrationBodyView> createState() => _RegistrationBodyViewState();
}

class _RegistrationBodyViewState extends State<RegistrationBodyView> {
  TextEditingController? _controllerPassword;
  final FocusNode _focusListenerPassword = FocusNode();
  bool _shouldShowPasswordValidationWidget = false;

  final formGroup = FormGroupRegistrationUserInfo();

  @override
  void initState() {
    _controllerPassword = TextEditingController();

    _focusListenerPassword.addListener(() {
      setState(() {
        _shouldShowPasswordValidationWidget = _focusListenerPassword.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalLine = Container(
      height: 3,
      width: 44,
      decoration: BoxDecoration(
        color: Color(0xff676f86).withOpacity(0.1),
      ),
    );
    final titleText = Text(
      'Nutzen Sie Hamster für Ihr \nUnternehmen.',
      style: TextStyle(fontSize: 20),
    );
    final subtitleText = Text(
      'Registrieren Sie sich jetzt, um Teil des deutschlandweiten Netzwerks zu werden.',
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
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              child: SizedBox(
                width: 390,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleText,
                        Container(height: 18),
                        horizontalLine,
                        Container(height: 18),
                        subtitleText,
                        Container(height: 25),
                        ReactiveFormBuilder(
                          form: formGroup.buildForm,
                          builder: (context, form, child) {
                            return Column(
                              children: [
                                FormTextField(
                                  name: 'name',
                                  hint: 'Vor- und Nachname',
                                  validationMessages: (control) =>
                                      formGroup.validationMessageNameSurname,
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: 'surname',
                                  hint: 'Nachnamen eingeben',
                                  validationMessages: (control) =>
                                      formGroup.validationMessageNameSurname,
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: 'email',
                                  hint: 'E-Mail',
                                  validationMessages: (control) =>
                                      formGroup.validationMessageEmail,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: 'password',
                                  hint: 'Passwort wählen',
                                  validationMessages: (control) =>
                                      formGroup.validationMessagePassword,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  controller: _controllerPassword,
                                  focusListener: _focusListenerPassword,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: 'passwordConfirmation',
                                  hint: 'Passwort wählen',
                                  validationMessages: (control) =>
                                      formGroup.validationMessagePassword,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                ),
                                Container(height: 28),

                                /// Bottom action buttons:
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WhiteButton(),
                                    ReactiveFormConsumer(
                                      builder: (context, formGroup, child) {
                                        return ActionButtonBlue(
                                          isEnabled: formGroup.valid,
                                          onPressed: () =>
                                              onPressedRegister(context),
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
            Padding(
              padding: const EdgeInsets.only(left: 800),
              child: Align(
                child: Visibility(
                  visible: _shouldShowPasswordValidationWidget,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, top: 156),
                    child: SizedBox(
                      width: 400,
                      child: Stack(
                        children: [
                          Center(
                            child: PasswordValidationView(
                              onPressed: onPressedClosePassword,
                              controllerPassword: _controllerPassword,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ],
                      ),
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

  void onPressedRegister(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
  }

  void onPressedClosePassword() {
    setState(() {
      _shouldShowPasswordValidationWidget = false;
    });
  }
}
