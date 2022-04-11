// TODO: remove when code is finalized
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/registration/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    // final l10n = context.l10n;
    return Scaffold(
      body: Center(child: RegistrationBodyView()),
    );
  }
}

class RegistrationBodyView extends StatelessWidget {
  RegistrationBodyView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  // final TextEditingController _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((RegistrationCubit cubit) => cubit.state);
    return Stack(
      children: [
        Image.asset(
          Assets.imagesBackgroundImageSignUp,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: SizedBox(
            width: 325,
            height: 412,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            decoration:InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Vor- und Nachname',
                            ),
                            onChanged: _onChangedName,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(70),
                            ]),
                            keyboardType: TextInputType.name,
                          )
                        ],
                      ),
                    ),

                    ///////

                    Text(
                      'Nutzen Sie Hamster für Ihr \nUnternehmen.',
                      style: TextStyle(fontSize: 20),
                    ),
                    // Small line ----
                    Text(
                        'Registrieren Sie sich jetzt, um Teil des deutschlandweiten Netzwerks zu werden.'),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Vor- und Nachname',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => onPressedRegister(context),
                      child: const Text('Submit'),
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
