// TODO: remove when code is finalized
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/registration/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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

class RegistrationBodyView extends StatelessWidget {
  RegistrationBodyView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        Center(
          child: SizedBox(
            width: 390,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nutzen Sie Hamster für Ihr \nUnternehmen.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(height: 18),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 3,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Color(0xff676f86)
                              .withOpacity(0.10000000149011612),
                        ),
                      ),
                    ),
                    Container(height: 18),
                    // Small line ----
                    Text(
                        'Registrieren Sie sich jetzt, um Teil des deutschlandweiten Netzwerks zu werden.'),
                    Container(height: 18),
                    FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Vor- und Nachname',
                            ),
                            onChanged: _onChangedName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(70),
                            ]),
                            keyboardType: TextInputType.name,
                          ),
                          Container(height: 18),
                          FormBuilderTextField(
                            name: 'surname',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nachnamen eingeben',
                            ),
                            onChanged: _onChangedName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(70),
                            ]),
                            keyboardType: TextInputType.name,
                          ),
                          Container(height: 18),
                          FormBuilderTextField(
                            name: 'e-mail',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'E-Mail',
                            ),
                            onChanged: _onChangedName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.email(),
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(70),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Container(height: 18),
                          FormBuilderTextField(
                            name: 'password',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Passwort wählen',
                            ),
                            onChanged: _onChangedName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(70),
                            ]),
                          ),
                          Container(height: 18),
                          FormBuilderTextField(
                            name: 'password_repeat',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Passwort wiederholen',
                            ),
                            onChanged: _onChangedName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(70),
                            ]),
                          ),
                        ],
                      ),
                    ),

                    Container(height: 25),

                    /// Buttons:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 145,
                          height: 37,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.5),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'ZURÜCK',
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 145,
                          height: 37,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.5),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'WEITER',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void onPressedRegister(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
  }

  void _onChangedName(String? value) {}
}
