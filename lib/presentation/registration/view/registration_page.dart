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
  final shouldEnable = true;

  final nameValidators = FormBuilderValidators.compose<String>([
    FormBuilderValidators.required(),
    FormBuilderValidators.max(70),
  ]);
  final surnameValidators = FormBuilderValidators.compose<String>([
    FormBuilderValidators.required(),
    FormBuilderValidators.max(70),
  ]);
  final emailValidators = FormBuilderValidators.compose<String>([
    FormBuilderValidators.email(),
    FormBuilderValidators.required(),
    FormBuilderValidators.max(70),
  ]);
  final passwordValidators = FormBuilderValidators.compose<String>([
    FormBuilderValidators.required(),
    FormBuilderValidators.max(70),
  ]);

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

    final buttonBack = SizedBox(
      width: 145,
      height: 37,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.5),
            side: BorderSide(width: 1)
          ),
        ),
        onPressed: () {},
        child: Text(
          'ZURÜCK',
          style: TextStyle(
            color: Color(0xff147bd9),
          ),
        ),
      ),
    );

    final buttonNextStep = SizedBox(
      width: 145,
      height: 37,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.5),
          ),
        ),
        onPressed: shouldEnable ? () => onPressedRegister(context) : null,
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

                    // Form:
                    FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          FormTextField(
                            name: 'name',
                            hint: 'Vor- und Nachname',
                            validators: nameValidators,
                            keyboardType: TextInputType.name,
                          ),
                          Container(height: 18),
                          FormTextField(
                            name: 'surname',
                            hint: 'Nachnamen eingeben',
                            validators: surnameValidators,
                            keyboardType: TextInputType.name,
                          ),
                          Container(height: 18),
                          FormTextField(
                            name: 'email',
                            hint: 'E-Mail',
                            validators: emailValidators,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Container(height: 18),
                          FormTextField(
                            name: 'password',
                            hint: 'Passwort wählen',
                            validators: passwordValidators,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Container(height: 18),
                          FormTextField(
                            name: 'password_repeat',
                            hint: 'Passwort wiederholen',
                            validators: passwordValidators,
                            keyboardType: TextInputType.emailAddress,
                          )
                        ],
                      ),
                    ),

                    Container(height: 28),

                    /// Buttons:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonBack,
                        buttonNextStep,
                      ],
                    ),
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
}

class FormTextField extends StatelessWidget {
  FormTextField({
    required this.name,
    required this.hint,
    required this.validators,
    required this.keyboardType,
    Key? key,
  }) : super(key: key);

  final String name;
  final String hint;
  final FormFieldValidator<String> validators;
  final TextInputType keyboardType;

  final outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0x4d676f86)),
  );

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        hintText: hint,
        hintStyle: TextStyle(color: Color(0x4d676f86)),
      ),
      validator: validators,
      keyboardType: keyboardType,
    );
  }
}
