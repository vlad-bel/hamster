import 'dart:typed_data';

import 'package:flutter/material.dart';

@immutable
class AppFile {
  const AppFile({
    required this.bytes,
    required this.name,
    this.size,
  });

  final Uint8List? bytes;
  final String? name;
  final int? size;
}

extension AppFileExtension on AppFile {
  String? get getExtension => name?.split('.').last;
}
