import 'dart:typed_data';

import 'package:business_terminal/domain/gateway/rest_client.dart';

///Uploading images from backend by filename
///Returns Uint8List
///Uses for loading or precaches files
Future<Uint8List?> loadImage({
  required RestClient client,
  required String fileName,
}) async {
  final result = await client.getFileByName(fileName);
  if (result is Map<String, dynamic> && result['buffer'] != null) {
    final bytes = Uint8List.fromList(
      List<int>.from(result['buffer']!['data'] as List<dynamic>),
    );
    return bytes;
  }

  return null;
}
