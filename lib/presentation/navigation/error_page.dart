import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.missingParams,
  });

  final List<String> missingParams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Some of these Params not found: $missingParams\n '
          'please return back and try again',
        ),
      ),
    );
  }
}
