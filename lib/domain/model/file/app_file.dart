import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class AppFile {
  final int? size;
  final String? extension;
  final String? name;
  final Uint8List? bytes;

  AppFile({
    required this.size,
    required this.extension,
    required this.name,
    required this.bytes,
  });
}
