import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20),
    );
  }
}

class TextTitleWithSpannable extends StatelessWidget {
  const TextTitleWithSpannable({
    Key? key,
    required this.title,
  }) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return title;
  }
}
