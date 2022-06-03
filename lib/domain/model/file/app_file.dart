import 'dart:typed_data';

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