import 'package:flutter/material.dart';

@immutable
class AppLanguageModel extends Locale {
  const AppLanguageModel(
    this.code,
    this.title,
    this.iconPath,
  ) : super(
          code,
        );

  final String code;
  final String iconPath;
  final String title;
}
