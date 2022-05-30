import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Unknown location: $path\n'
          'Please return back and try another path',
        ),
      ),
    );
  }
}
