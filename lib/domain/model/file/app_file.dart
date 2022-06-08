import 'dart:typed_data';

import 'package:flutter/material.dart';

@immutable
class AppFile {
  const AppFile({
    required this.bytes,
    required this.name,
    required this.extension,
    this.size,
  });

  final Uint8List? bytes;
  final String extension;
  final String? name;
  final int? size;

  String? get getExtension => name?.split('.').last;

  String get createName => '${DateTime.now()}.$extension';
}
