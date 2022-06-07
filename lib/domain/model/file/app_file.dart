import 'dart:typed_data';

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
}
