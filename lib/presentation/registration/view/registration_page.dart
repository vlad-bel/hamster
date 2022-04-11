// TODO: remove when code is finalized
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/registration/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<RegistrationCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<RegistrationCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((RegistrationCubit cubit) => cubit.state);
    return Column(
      children: [
        Text('Nutzen Sie Hamster für Ihr \nUnternehmen.',
            style: TextStyle(fontSize: 20)),
        // Small line ----
        Text(
            'Registrieren Sie sich jetzt, um Teil des deutschlandweiten Netzwerks zu werden.'),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Vor- und Nachname',
          ),
        ),
      ],
    );
  }
}
