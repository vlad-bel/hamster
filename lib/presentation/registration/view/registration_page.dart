// TODO: remove when code is finalized
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/registration/cubit/registration_cubit.dart';
import 'package:business_terminal/presentation/registration/view/white_button.dart';
import 'package:business_terminal/presentation/registration/widgets/check_box_icon.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
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

    final buttonBack = WhiteButton();

    SizedBox buttonNextStep({bool isEnabled = false}) => SizedBox(
          width: 145,
          height: 37,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.5),
                ),
              ),
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return TextStyle(color: Color(0x66676f86));
                }
                return TextStyle(color: Colors.white);
              }),
            ),
            onPressed: isEnabled ? () => onPressedRegister(context) : null,
            child: Text(
              'WEITER',
            ),
          ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: PasswordCheckboxes(),
              ),
            ),

            ///
            Center(
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
                          form: FormGroupRegistrationUserInfo().buildForm,
                          builder: (context, form, child) {
                            return Column(
                              children: [
                                ReactiveFormTextField(
                                  name: 'name',
                                  hint: 'Vor- und Nachname',
                                  validationMessages: (control) => {
                                    ValidationMessage.required:
                                        'The name must not be empty'
                                  },
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                ReactiveFormTextField(
                                  name: 'surname',
                                  hint: 'Nachnamen eingeben',
                                  validationMessages: (control) => {
                                    ValidationMessage.required:
                                        'The surname must not be empty'
                                  },
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                ReactiveFormTextField(
                                  name: 'email',
                                  hint: 'E-Mail',
                                  validationMessages: (control) => {
                                    ValidationMessage.required:
                                        'The email must not be empty',
                                    ValidationMessage.email:
                                        'The email value must be a valid email',
                                  },
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                ReactiveFormTextField(
                                  name: 'password',
                                  hint: 'Passwort wählen',
                                  validationMessages: (control) => {
                                    ValidationMessage.required:
                                        'The password must not be empty',
                                  },
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                Container(height: 18),
                                ReactiveFormTextField(
                                  name: 'passwordConfirmation',
                                  hint: 'Passwort wählen',
                                  validationMessages: (control) => {
                                    ValidationMessage.required:
                                        'The password must not be empty',
                                  },
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                ),
                                Container(height: 28),

                                /// Buttons:
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buttonBack,
                                    ReactiveFormConsumer(
                                      builder: (context, formGroup, child) {
                                        return buttonNextStep(
                                          isEnabled: formGroup.valid,
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
        )
      ],
    );
  }

  void onPressedRegister(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
  }
}

class PasswordCheckboxes extends StatelessWidget {
  PasswordCheckboxes({
    Key? key,
  }) : super(key: key);

  final boxDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Color(0x29000000),
        offset: Offset(0, 3),
        blurRadius: 6,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: Color(0xffe10054),
                  size: 80,
                ),
              ],
            ),
            Container(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dein Passwort muss mindestens die \nnachfolgenden Kriterien erfüllen:',
                ),
                Container(height: 20),
                CheckBoxIconGreen(
                  text: '10 Zeichen lang',
                  enabled: true,
                ),
                CheckBoxIconGreen(
                  text: '1 Kleinbuchstabe',
                  enabled: false,
                ),
                CheckBoxIconGreen(
                  text: '1 Großbuchstabe',
                  enabled: false,
                ),
                CheckBoxIconGreen(
                  text: '1 Zahl',
                  enabled: false,
                ),
                CheckBoxIconGreen(
                  text: '1 Sonderzeichen',
                  enabled: false,
                ),
                Container(height: 24),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 28),
                  child: Text(
                    'Hinweis schließen',
                    style: TextStyle(
                      color: Color(0xffe10054),
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
