import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class AppFile {
  AppFile({
    required this.size,
    required this.extension,
    required this.name,
    this.color,
    required this.bytes,
  });

  final Uint8List? bytes;

// TODO REMOVe
  final String? color;

  final String? extension;
  final String? name;
  final int? size;

  factory AppFile.fromFilePickerResult(FilePickerResult result) => AppFile(
        size: result.files.first.size,
        extension: result.files.first.extension,
        name: result.files.first.name,
        bytes: result.files.first.bytes,
      );
}
