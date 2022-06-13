import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

@immutable
///Image file of app
class AppFile {
  const AppFile({
    required this.bytes,
    required this.name,
    required this.extension,
    this.size,
  });

  ///bytes representation of image
  final Uint8List? bytes;
  /// image ext like 'png', 'jpg' etc
  final String extension;
  /// filename
  final String? name;

  ///size in bytes
  final int? size;

  String? get getExtension => name?.split('.').last;

  String get createName => '${DateTime.now()}.$extension';

  factory AppFile.fromFilePickerResult(FilePickerResult result) => AppFile(
        size: result.files.first.size,
        extension: result.files.first.extension!,
        name: result.files.first.name,
        bytes: result.files.first.bytes,
      );
}
