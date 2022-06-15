import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
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

  factory AppFile.fromFilePickerResult(FilePickerResult result) => AppFile(
        size: result.files.first.size,
        extension: result.files.first.extension!,
        name: result.files.first.name,
        bytes: result.files.first.bytes,
      );

  factory AppFile.fromJson(Map<String, dynamic> json) {
    final bytes = Uint8List.fromList(
      // ignore: avoid_dynamic_calls
      List<int>.from(json['buffer']!['data'] as List<dynamic>),
    );
    return AppFile(bytes: bytes, name: '', extension: '');
  }
}
